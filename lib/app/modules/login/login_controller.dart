import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/data/models/login_user.dart';
import '../../../routes/app_pages.dart';
import '../../features/authentication/authentication_controller.dart';
import '../../features/authentication/authentication_state.dart';

class LoginController extends GetxController {
  final AuthenticationController _authController;
  LoginController(this._authController);

  final _loading = false.obs;
  set loading(value) => _loading.value = value;
  get loading => _loading.value;

  final _hidePassword = true.obs;
  set hidePassword(value) => _hidePassword.value = value;
  get hidePassword => _hidePassword.value;

  login(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      Get.rawSnackbar(
          message: 'Preencha o usuário e senha !',
          duration: const Duration(seconds: 2));
    } else {
      loading = true;
      bool? log = await _authController.login(username, password);

      loading = false;
      if (log == null) {
        Get.rawSnackbar(
            message: 'Erro ao autenticar, tente novamente !',
            duration: const Duration(seconds: 3));
      } else if (log == false) {
        Get.rawSnackbar(
            message: 'E-mail ou senha incorretos !',
            duration: const Duration(seconds: 3));
      }
      if (Get.arguments != null) {
        var returnUrl = Get.arguments['returnUrl'];
        await Get.toNamed(returnUrl);
      }
    }
  }

  openRegisterPage() async {
    await Get.toNamed(AppRoutes.REGISTER);
  }
}
