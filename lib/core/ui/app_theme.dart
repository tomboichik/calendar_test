import 'package:calendar_test/core/ui/app_colors.dart';
import 'package:flutter/material.dart';

final appThemeData = ThemeData(
  primaryColor: AppColors.primaryColor,
  accentColor: AppColors.accentColor,
  primaryColorLight: AppColors.primaryLightColor,
  textTheme: const TextTheme(
      headline3: TextStyle(
        fontSize: 22,
        color: AppColors.colorBlack,
        fontWeight: FontWeight.w600,
      ),
      headline6: TextStyle(
        fontSize: 16,
        color: AppColors.colorBlack,
        fontWeight: FontWeight.w600,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      )),
);
