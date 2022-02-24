import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';

class SplashScreenPage extends GetView {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: Get.height,
      width: Get.width,
      color: AppColors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Image.asset(
              'assets/images/hmv_logo.png',
              color: AppColors.white,
            ),
            height: 200,
          ),
          const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                  color: AppColors.white, strokeWidth: 2))
        ],
      ),
    ));
  }
}
