import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/modules/home/tabs/pacientes_tab.dart';
import 'package:hmv_care_app/app/modules/home/tabs/profile_tab.dart';
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
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.account_circle), label: 'Meu Perfil')
                  ]),
            )),
        body: Container(
          color: AppColors.blue,
          height: 100.h,
          width: 100.w,
          child: SafeArea(
              child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              if (controller.userGroup == 'pacientes') PacientesTab(),
              if (controller.userGroup == 'hospital') HospitalTab(),
              if (controller.userGroup == 'medicos') PacientesTab(),
              if (controller.userGroup == 'pacientes') ProfileTab()
            ],
            onPageChanged: (idx) {
              controller.currentTab = idx;
            },
          )),
        ));
  }
}
