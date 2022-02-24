import 'package:get/get.dart';
import 'package:hmv_care_app/app/modules/emergencia/emergencia_binding.dart';
import 'package:hmv_care_app/app/modules/emergencia/emergencia_page.dart';
import 'package:hmv_care_app/routes/auth_guard.dart';
import '../app/modules/home/home_binding.dart';
import '../app/modules/home/home_page.dart';
import '../app/modules/login/login_binding.dart';
import '../app/modules/login/login_page.dart';
import '../app/modules/register/register_binding.dart';
import '../app/modules/register/register_page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    /*GetPage(
      name: AppRoutes.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),*/
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      middlewares: [AuthGuard()],
    ),
    GetPage(
      name: AppRoutes.EMERGENCIA,
      page: () => EmergenciaPage(),
      binding: EmergenciaBinding(),
      middlewares: [AuthGuard()],
    ),
  ];
}
