import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/features/authentication/authentication_controller.dart';
import 'package:hmv_care_app/app/features/authentication/authentication_state.dart';
import 'app_pages.dart';

class AuthGuard extends GetMiddleware {
//   The default is 0 but you can update it to any number. Please ensure you match the priority based
//   on the number of guards you have.
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    // Navigate to login if client is not authenticated other wise continue
    bool isAuthenticated =
        Get.find<AuthenticationController>().state is Authenticated;

    if (!isAuthenticated || route == AppRoutes.LOGIN) {
      return RouteSettings(
          name: AppRoutes.LOGIN,
          arguments: route != AppRoutes.LOGIN
              ? {'returnUrl': route}
              : {'returnUrl': AppRoutes.INITIAL});
    }
    return null;
  }
}
