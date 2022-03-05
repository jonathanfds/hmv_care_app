import 'package:get/get.dart';

import '../app/modules/emergencia/solicitar_emergencia_binding.dart';
import '../app/modules/emergencia/solicitar_emergencia_page.dart';
import '../app/modules/habitos/habitos_page.dart';
import '../routes/auth_guard.dart';
import '../app/modules/habitos/habitos_binding.dart';
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
      name: AppRoutes.SOLICITAR_EMERGENCIA,
      page: () => SolicitarEmergenciaPage(),
      binding: SolicitarEmergenciaBinding(),
      middlewares: [AuthGuard()],
    ),
    GetPage(
      name: AppRoutes.HABITOS_SAUDE,
      page: () => HabitosPage(),
      binding: HabitosBinding(),
      middlewares: [AuthGuard()],
    ),
  ];
}
