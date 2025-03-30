import 'package:flutter/material.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';

class AppOutlinedButtonTheme {
  static final lightOutlinedButton = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.textPrimary,
      textStyle: TextStyle(
        fontSize: AppSizes.fontSm,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.md,
        horizontal: AppSizes.lg,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.borderRound),
      ),
      side: BorderSide(color: AppColors.lightBorder),
    ),
  );
}
