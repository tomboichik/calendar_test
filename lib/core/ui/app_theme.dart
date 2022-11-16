import 'package:calendar_test/core/ui/app_colors.dart';
import 'package:flutter/material.dart';

final appThemeData = ThemeData(
    primaryColor: AppColors.primaryColor,
    accentColor: AppColors.accentColor,
    textTheme: const TextTheme(
        headline3: TextStyle(
      fontSize: 22,
      color: AppColors.colorBlack,
      fontWeight: FontWeight.w600,
    )));
