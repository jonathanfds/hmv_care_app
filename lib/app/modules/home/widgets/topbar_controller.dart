import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/features/authentication/authentication_controller.dart';

class HMVTopbarController extends GetxController {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _menuIndex = 0.obs;
  set menuIndex(value) => _menuIndex.value = value;
  get menuIndex => _menuIndex.value;

  var menuItems = ['Emergencias', 'Pacientes'].obs;
  void openOrCloseDrawer() {
    if (_scaffoldKey.currentState != null) {
      if (_scaffoldKey.currentState!.isDrawerOpen) {
        _scaffoldKey.currentState!.openEndDrawer();
      } else {
        _scaffoldKey.currentState!.openDrawer();
      }
    }
  }

  void setMenuIndex(int index) {
    menuIndex = index;
  }

  logoutApp() async {
    await Get.find<AuthenticationController>().logout();
  }
}
