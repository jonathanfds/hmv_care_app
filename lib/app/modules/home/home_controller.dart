import 'package:brasil_fields/brasil_fields.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/data/models/emergencia.dart';
import 'package:hmv_care_app/app/data/models/paciente.dart';
import 'package:hmv_care_app/app/data/providers/datastorage_api.dart';
import 'package:hmv_care_app/app/data/repositories/pacientes_repository.dart';
import 'package:hmv_care_app/app/features/authentication/authentication_controller.dart';
import 'package:hmv_care_app/app/features/authentication/authentication_state.dart';
import 'package:hmv_care_app/app/modules/lista_pacientes/lista_pacientes_controller.dart';
import 'package:hmv_care_app/app/modules/lista_pacientes/lista_pacientes_page.dart';
import 'package:intl/intl.dart';

import '../../../routes/app_pages.dart';
import '../../data/models/login_user.dart';
import '../../data/providers/dio_custom_client.dart';
import '../../data/repositories/emergencias_repository.dart';

class HomeController extends GetxController {
  final PacientesRepository _pacientesRepository;
  final EmergenciasRepository _emergenciasRepository;
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
    if (userGroup == 'hospital') {
      Get.put<ListaPacientesController>(
          ListaPacientesController(_pacientesRepository));
      allEmergencias = await _emergenciasRepository.getAll();
      allEmergencias.sort(emergenciaCompareByDate);
      selectedEmergenciaIdx = 0;
      emergencias.value = allEmergencias;
    }
    loading = false;
  }

  int emergenciaCompareByDate(Emergencia a, Emergencia b) {
    var dateFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
    final propertyA = dateFormat.parse(a.data!);
    final propertyB = dateFormat.parse(b.data!);

    if (a.severidade == "Grave") return -1;

    if (b.severidade == "Grave") return 1;

    if (propertyA.isBefore(propertyB)) {
      return 1;
    } else if (propertyA.isAfter(propertyB)) {
      return -1;
    } else {
      return 0;
    }
  }

  openEmergencia() async {
    var pacienteProfile = await _pacientesRepository.getById(user.userId!);
    await Get.toNamed(AppRoutes.SOLICITAR_EMERGENCIA,
        arguments: pacienteProfile);
  }

  openHabitos() async {
    var pacienteProfile = await _pacientesRepository.getById(user.userId!);
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
