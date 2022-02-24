import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onTap;

  const CustomButton({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        child: Text(
          text,
          style: KTextStyle.buttonTextStyle,
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all(const StadiumBorder(
                side: BorderSide(width: .5, color: Colors.white))),
            fixedSize:
                MaterialStateProperty.all(Size(300, Get.height * 0.05))));
  }
}
