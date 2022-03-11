import 'package:brasil_fields/brasil_fields.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/data/providers/graphql_storage_api.dart';
import 'package:hmv_care_app/app/data/repositories/pacientes_repository.dart';
import 'package:hmv_care_app/app/features/authentication/authentication_controller.dart';
import 'package:hmv_care_app/app/features/authentication/authentication_state.dart';
import '../../../routes/app_pages.dart';
import 'package:hmv_care_app/app/data/models/ModelProvider.dart';
import '../../data/models/login_user.dart';
import '../../data/providers/dio_custom_client.dart';
import '../../data/repositories/emergencias_repository.dart';

class ListaPacientesController extends GetxController {
  final IPacientesRepository _pacientesRepository;
  late AuthenticationController _authController;
  List<Pacientes> allPacientes = [];
  RxList pacientes = [].obs;
  final _loading = true.obs;
  set loading(value) => _loading.value = value;
  get loading => _loading.value;

  @override
  void onInit() async {
    super.onInit();
    _authController = Get.find();
    loadPacientes();
  }

  ListaPacientesController(this._pacientesRepository);

  User get user => (_authController.state as Authenticated).userInfo;

  Future loadPacientes() async {
    allPacientes = await _pacientesRepository.getAll();
    pacientes.value = allPacientes;
    loading = false;
  }

  logoutApp() async {
    await _authController.logout();
  }

  openCadastroPaciente() async {
    await Get.toNamed(AppRoutes.REGISTER);
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
