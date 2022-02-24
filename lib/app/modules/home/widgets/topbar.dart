import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/modules/home/home_controller.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class HMVTopbar extends StatelessWidget {
  const HMVTopbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/hmv_icon.png',
          height: 32,
          width: 32,
        ),
        const SizedBox(width: 5),
        Text(
          'HMV Care',
          style: KTextStyle.titleTextStyle.copyWith(color: AppColors.white),
        ),
        const Spacer(),
        IconButton(
            onPressed: () async {
              await Get.find<HomeController>().logoutApp();
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: AppColors.white,
            ))
      ],
    );
  }
}
