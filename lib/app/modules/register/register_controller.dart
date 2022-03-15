import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/data/models/login_user.dart';
import 'package:hmv_care_app/app/modules/lista_pacientes/lista_pacientes_controller.dart';
import 'package:hmv_care_app/core/theme/app_colors.dart';
import '../../../core/utils/constants.dart';
import '../../data/services/interfaces/authentication_service.dart';
import '../../widgets/custom_formfield.dart';

class RegisterController extends GetxController {
  final _sexoMasc = Rxn<bool>();
  set sexoMasc(value) => _sexoMasc.value = value;
  get sexoMasc => _sexoMasc.value;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController dtNascController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController nomeMaeController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController confirmCodeController = TextEditingController();

  IAuthenticationService _authService;
  RegisterController(this._authService);

  final _hidePassword = true.obs;
  set hidePassword(value) => _hidePassword.value = value;
  get hidePassword => _hidePassword.value;

  final _hideConfirmPassword = true.obs;
  set hideConfirmPassword(value) => _hideConfirmPassword.value = value;
  get hideConfirmPassword => _hideConfirmPassword.value;

  Future register() async {
    User user = User(
        username: emailController.text,
        cpf: cpfController.text.replaceAll('-', '').replaceAll('.', ''),
        dtNascimento: dtNascController.text,
        email: emailController.text,
        endereco: enderecoController.text,
        groups: ['pacientes'],
        name: nameController.text,
        nomeMae: nomeMaeController.text,
        sexo: sexoMasc ? "M" : "F",
        telefone: '+55${telefoneController.text}');

    //Criar password genérico, para alterar no primeiro acesso
    var password = Constants.DEFAULT_PASSWORD;
    var result = await _authService.registerUser(user, password);
    if (result) {
      await Get.defaultDialog(
          title: 'Confirmar Cadastro',
          textConfirm: 'Confirmar',
          textCancel: 'Cancelar',
          confirmTextColor: AppColors.blue,
          buttonColor: Colors.white,
          onConfirm: () {
            Get.back();
          },
          content: Center(
            child: CustomFormField(
              headingText: "Código de Confirmação",
              hintText: "Código de Confirmação",
              obsecureText: false,
              suffixIcon: const SizedBox(),
              controller: confirmCodeController,
              maxLines: 1,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.name,
            ),
          ));
      var codigo = confirmCodeController.text;
      if (codigo != null && codigo.isNotEmpty) {
        var confirmResult =
            await _authService.confirmUser(emailController.text, codigo);
        if (confirmResult) {
          //Recarrega a lista
          Get.find<ListaPacientesController>().loadPacientes();
          Get.back();
          Get.rawSnackbar(
              message: 'Usuario cadastrado !',
              duration: const Duration(seconds: 3));
        } else {
          Get.rawSnackbar(
              message: 'Erro ao confirmar código !',
              duration: const Duration(seconds: 3));
        }
      }
    } else {
      Get.rawSnackbar(
          message: 'Erro ao cadastrar usuário',
          duration: const Duration(seconds: 3));
    }
  }
}
