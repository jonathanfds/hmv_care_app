import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/modules/home/tabs/pacientes_tab.dart';
import 'package:hmv_care_app/app/modules/home/tabs/profile_tab.dart';
import 'package:hmv_care_app/app/modules/home/widgets/topbar.dart';
import 'package:hmv_care_app/app/modules/lista_pacientes/lista_pacientes_page.dart';
import 'package:hmv_care_app/core/theme/app_text_styles.dart';
import 'package:sizer/sizer.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../core/theme/app_colors.dart';
import 'home_controller.dart';
import 'tabs/hospital_tab.dart';
import 'widgets/menu_item.dart';

class HomePage extends GetView<HomeController> {
  final PageController _pageController = PageController();

  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx(() => Visibility(
              visible: (controller.userGroup == 'pacientes'),
              child: BottomNavigationBar(
                  currentIndex: controller.currentTab,
                  onTap: (idx) {
                    controller.currentTab = idx;
                    _pageController.animateToPage(idx,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon((controller.userGroup == 'pacientes')
                          ? Icons.home
                          : Icons.home),
                      label: (controller.userGroup == 'pacientes')
                          ? 'Home'
                          : 'Emergencias',
                    ),
                    if (controller.userGroup == 'pacientes')
                      const BottomNavigationBarItem(
                          icon: Icon(Icons.account_circle), label: 'Meu Perfil')
                    else if (controller.userGroup == 'hospital')
                      const BottomNavigationBarItem(
                          icon: Icon(Icons.account_circle), label: 'Pacientes')
                  ]),
            )),
        body: Container(
          height: 100.0.h,
          width: 100.0.w,
          color: AppColors.blue,
          child: SafeArea(
            child: SizedBox(
              height: 90.0.h,
              width: 100.0.w,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 7.h,
                    width: 100.w,
                    child: HMVTopbar(
                      showMenuItems: (controller.userGroup == 'hospital'),
                      onChangeMenu: (idx) {
                        controller.currentTab = idx;
                        _pageController.animateToPage(idx,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linearToEaseOut);
                      },
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      children: [
                        if (controller.userGroup == 'pacientes') PacientesTab(),
                        if (controller.userGroup == 'hospital') HospitalTab(),
                        if (controller.userGroup == 'hospital')
                          ListaPacientesPage(),
                        if (controller.userGroup == 'medicos') PacientesTab(),
                        if (controller.userGroup == 'pacientes') ProfileTab()
                      ],
                      onPageChanged: (idx) {
                        controller.currentTab = idx;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
