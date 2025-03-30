import 'package:flutter/material.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';

class AppElevatedButtonTheme {
  // Shared base style for all buttons
  static final ButtonStyle _baseStyle = ElevatedButton.styleFrom(
    elevation: 0,
    textStyle: const TextStyle(
      fontSize: AppSizes.fontSm,
      fontWeight: FontWeight.w600,
    ),
    padding: EdgeInsets.symmetric(
      vertical: AppSizes.md,
      horizontal: AppSizes.lg,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRound),
    ),
  );

  // Primary Button (Light Mode)
  static final primaryButton = ElevatedButtonThemeData(
    style: _baseStyle.copyWith(
      foregroundColor: MaterialStateProperty.all(AppColors.textWhite),
      backgroundColor: MaterialStateProperty.all(AppColors.primary),
    ),
  );

  static final secondaryButton = ElevatedButtonThemeData(
    style: _baseStyle.copyWith(
      foregroundColor: MaterialStateProperty.all(AppColors.primary),
      backgroundColor: MaterialStateProperty.all(AppColors.secondary),
      side: MaterialStateProperty.all(BorderSide.none),
    ),
  );
}
