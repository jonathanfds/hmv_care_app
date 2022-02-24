import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hmv_care_app/core/theme/app_colors.dart';

final ThemeData appThemeData = ThemeData(
    primaryColor: AppColors.blue,
    colorScheme: const ColorScheme.light(
        secondary: AppColors.gray,
        background: AppColors.white,
        primary: AppColors.blue),
    textTheme: GoogleFonts.montserratTextTheme());
