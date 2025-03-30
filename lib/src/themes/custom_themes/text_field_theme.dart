import 'package:flutter/material.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';

class AppTextFieldTheme {
  AppTextFieldTheme._();

  static InputDecorationTheme lightInputDecoration = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.textPrimary,
    suffixIconColor: AppColors.textPrimary,
    labelStyle: TextStyle().copyWith(fontSize: AppSizes.fontSm),
    hintStyle: TextStyle().copyWith(
      fontSize: AppSizes.fontSm,
      fontWeight: FontWeight.w400,
    ),
    errorStyle: TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: TextStyle().copyWith(color: AppColors.textPrimary),
    border: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
      borderSide: BorderSide(width: 1.0, color: AppColors.primary),
    ),
    errorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
      borderSide: BorderSide(width: 1.0, color: AppColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
      borderSide: BorderSide(width: 2.0, color: Colors.orange),
    ),
    filled: true,
    fillColor: AppColors.lightGrey,
  );
}
