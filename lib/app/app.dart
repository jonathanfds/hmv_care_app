import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/features/authentication/authentication_controller.dart';
import 'package:hmv_care_app/app/modules/home/home_binding.dart';
import 'package:hmv_care_app/app/modules/home/home_page.dart';
import 'package:hmv_care_app/app/modules/register/register_page.dart';
import '/core/theme/app_theme.dart';
import 'data/providers/graphql_storage_api.dart';
import 'features/authentication/authentication_state.dart';
import 'modules/login/login_binding.dart';
import '../routes/app_pages.dart';
import 'modules/login/login_page.dart';
import 'modules/splashscreen/splashscreen_page.dart';

class MyApp extends GetView<AuthenticationController> {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return buildGetApp();
  }

  Widget buildGetApp() {
    //ScreenUtil.setContext(Get.context!);
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.INITIAL,
          getPages: AppPages.pages,
          defaultTransition: Transition.cupertino,
          theme: appThemeData,
          home: buildObservablePage());
    });
  }

  Obx buildObservablePage() {
    return Obx((() {
      if (controller.state is Authenticated) {
        HomeBinding().dependencies();
        return HomePage();
      } else if (controller.state is UnAuthenticated) {
        LoginBinding().dependencies();
        return LoginPage();
      } else {
        return const SplashScreenPage();
      }
    }));
  }
}
