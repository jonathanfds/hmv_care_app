import 'package:get/get.dart';
import '../../data/services/interfaces/authentication_service.dart';

class RegisterController extends GetxController {
  IAuthenticationService _authService;
  RegisterController(this._authService);

  final _hidePassword = true.obs;
  set hidePassword(value) => _hidePassword.value = value;
  get hidePassword => _hidePassword.value;

  final _hideConfirmPassword = true.obs;
  set hideConfirmPassword(value) => _hideConfirmPassword.value = value;
  get hideConfirmPassword => _hideConfirmPassword.value;
}
