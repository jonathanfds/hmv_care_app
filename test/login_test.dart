// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/data/services/authentication/amplify_auth_service.dart';
import 'package:hmv_care_app/app/data/services/authentication/api_auth_service.dart';
import 'package:hmv_care_app/app/data/services/interfaces/authentication_service.dart';
import 'package:hmv_care_app/app/features/authentication/authentication_controller.dart';
import 'package:hmv_care_app/app/modules/login/login_controller.dart';
import 'package:hmv_care_app/app/modules/login/login_page.dart';

void main() async {
  var authService = ApiAuthService();
  LoginController login =
      LoginController(AuthenticationController(authService));
  test('Testa e-mail válido', () {
    var email = "email.teste@gmail.com";
    expect(login.validateEmail(email), true);
  });
  test('Testa e-mail inválido', () {
    var email = "email.teste.gmail.com";
    expect(login.validateEmail(email), false);
  });
  test('Testa e-mail vazio', () {
    var email = "";
    expect(login.validateEmail(email), false);
  });
}
