import 'package:brasil_fields/brasil_fields.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:hmv_care_app/app/data/models/ModelProvider.dart';
import 'package:hmv_care_app/app/data/repositories/pacientes_repository.dart';
import 'package:hmv_care_app/app/features/authentication/authentication_controller.dart';
import 'package:hmv_care_app/app/features/authentication/authentication_state.dart';
import 'package:hmv_care_app/app/modules/lista_pacientes/lista_pacientes_controller.dart';
import 'package:intl/intl.dart';
import '../../../core/utils/functions.dart';
import '../../../routes/app_pages.dart';
import '../../data/models/login_user.dart';
import '../../data/repositories/emergencias_repository.dart';

class HomeController extends GetxController {
  final IPacientesRepository _pacientesRepository;
  final IEmergenciasRepository _emergenciasRepository;
  late AuthenticationController _authController;
  List<Emergencia> allEmergencias = [];
  RxList emergencias = [].obs;

  final _loading = true.obs;
  set loading(value) => _loading.value = value;
  get loading => _loading.value;

  final _selectedEmergenciaIdx = (-1).obs;
  set selectedEmergenciaIdx(value) => _selectedEmergenciaIdx.value = value;
  get selectedEmergenciaIdx => _selectedEmergenciaIdx.value;

  Emergencia get selectedEmergencia => allEmergencias[selectedEmergenciaIdx];
  bool isSubscribed = false;
  @override
  void onInit() async {
    super.onInit();
    _authController = Get.find();

    loadEmergencias();
  }

  HomeController(this._pacientesRepository, this._emergenciasRepository);

  final _currentTab = 0.obs;
  set currentTab(value) => _currentTab.value = value;
  get currentTab => _currentTab.value;

  User get user => (_authController.state as Authenticated).userInfo;

  Future loadEmergencias() async {
    loading = true;
    if (userGroup == 'hospital') {
      Get.put<ListaPacientesController>(
          ListaPacientesController(_pacientesRepository));
      allEmergencias = await _emergenciasRepository.getAll();
      allEmergencias.sort(emergenciaCompareByDate);
      selectedEmergenciaIdx = 0;
      emergencias.value = allEmergencias;

      if (!isSubscribed) {
        subscribe();
        isSubscribed = true;
      }
      emergencias.refresh();
    }
    loading = false;
  }

  subscribe() {
    //Mover para provider
    var client = Get.find<GraphQLClient>();
    final subscriptionDocument = gql(
      r'''
    subscription mysubs {
                        onCreateEmergencia {                          
                            _deleted
                            _lastChangedAt
                            _version
                            createdAt
                            data
                            emergenciaPacienteId
                            id
                            localizacao
                            owner                            
                            questionario {
                              resposta
                              pergunta
                            }
                            severidade
                            status
                            updatedAt
                          }
                        }
                      
  ''',
    );
    var subscription = client.subscribe(
      SubscriptionOptions(
        document: subscriptionDocument,
      ),
    );
    subscription.listen((event) async {
      if (!event.hasException) {
        print('NOVA EMERGENCIA ADICIONADA !');
        var item = event.data!["onCreateEmergencia"];
        var emergencia = Emergencia.fromRawJson(item);

        var paciente = await _pacientesRepository
            .getById(emergencia.emergenciaPacienteId!);
        if (paciente != null) {
          emergencia = emergencia.copyWith(paciente: paciente);
          allEmergencias.add(emergencia);
          allEmergencias.sort(emergenciaCompareByDate);
          emergencias.value = allEmergencias;
          emergencias.refresh();
        }
      } else {
        print('ERRO SUBSCRIPTION');
      }
    });
  }

  int emergenciaCompareByDate(Emergencia a, Emergencia b) {
    var dateFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
    final propertyA = dateFormat.parse(a.data!);
    final propertyB = dateFormat.parse(b.data!);

    if (a.severidade == EmergenciaSeveridadeEnum.GRAVE) return -1;

    if (b.severidade == EmergenciaSeveridadeEnum.GRAVE) return 1;

    if (propertyA.isBefore(propertyB)) {
      return 1;
    } else if (propertyA.isAfter(propertyB)) {
      return -1;
    } else {
      return 0;
    }
  }

  int calcularIdade(String date) {
    return calc_idade(date);
  }

  openEmergencia() async {
    var pacienteProfile = await _pacientesRepository.getById(user.userId!);
    await Get.toNamed(AppRoutes.SOLICITAR_EMERGENCIA,
        arguments: pacienteProfile);
  }

  openHabitos() async {
    var pacienteProfile = await _pacientesRepository.getById(user.userId!);
    if (pacienteProfile == null) {
      pacienteProfile = Pacientes(
          user_id: user.userId,
          cpf: user.cpf,
          data_nascimento: user.dtNascimento,
          email: user.email,
          nome_mae: user.nomeMae,
          nome_completo: user.name,
          endereco: user.endereco,
          telefone: user.telefone);
      await _pacientesRepository.insert(pacienteProfile);
    }
    await Get.toNamed(AppRoutes.HABITOS_SAUDE, arguments: pacienteProfile);
  }

  String formatCPF(String cpf) {
    try {
      return UtilBrasilFields.obterCpf(
        cpf,
      );
    } catch (e) {}
    return cpf;
  }

  String formatTelefone(String tel) {
    try {
      return UtilBrasilFields.obterTelefone(tel.replaceAll('+55', ''));
    } catch (e) {}
    return tel;
  }

  get userGroup =>
      (_authController.state as Authenticated).userInfo.groups.first;
}
