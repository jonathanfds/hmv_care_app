import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmv_care_app/app/modules/home/home_controller.dart';
import 'package:hmv_care_app/app/modules/home/widgets/topbar_controller.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class HMVTopbar extends StatelessWidget {
  var controller = Get.put<HMVTopbarController>(HMVTopbarController());
  HMVTopbar({Key? key, this.showMenuItems = false, this.onChangeMenu})
      : super(key: key);
  Function(int)? onChangeMenu;
  bool showMenuItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
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
          const SizedBox(width: 50),
          showMenuItems
              ? Obx(() => Wrap(
                  direction: Axis.horizontal,
                  spacing: 15,
                  children: controller.menuItems.map((e) {
                    var isSelected =
                        controller.menuIndex == controller.menuItems.indexOf(e);
                    return InkWell(
                      onTap: () {
                        var idx = controller.menuItems.indexOf(e);
                        controller.setMenuIndex(idx);
                        if (onChangeMenu != null) {
                          onChangeMenu!(idx);
                        }
                      },
                      child: Text(
                        e,
                        style: KTextStyle.normalText.copyWith(
                            color: isSelected ? Colors.white : Colors.white70,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                    );
                  }).toList()))
              : Container(),
          const Spacer(),
          IconButton(
              onPressed: () async {
                await controller.logoutApp();
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: AppColors.white,
              ))
        ],
      ),
    );
  }
}
