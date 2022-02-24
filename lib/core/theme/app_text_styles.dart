import 'package:flutter/material.dart';

import 'app_colors.dart';

class KTextStyle {
  static const headerTextStyle = TextStyle(
      color: AppColors.blue, fontSize: 28, fontWeight: FontWeight.w700);

  static const titleTextStyle = TextStyle(
      color: AppColors.blue, fontSize: 20, fontWeight: FontWeight.w700);

  static const textFieldHeading = TextStyle(
      color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w700);

  static const normalText = TextStyle(
      color: Colors.black87, fontSize: 16, fontWeight: FontWeight.normal);

  static const textFieldHintStyle = TextStyle(
      color: AppColors.hintText, fontSize: 14, fontWeight: FontWeight.w500);

  static const textStyle = TextStyle(
      color: Colors.black87, fontSize: 14, fontWeight: FontWeight.normal);

  static const buttonTextStyle = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.white);
}
