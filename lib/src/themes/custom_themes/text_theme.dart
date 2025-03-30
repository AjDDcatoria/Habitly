import 'package:flutter/material.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(
      fontSize: AppSizes.font2Xl,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
    headlineMedium: TextStyle().copyWith(
      fontSize: AppSizes.fontXl,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    headlineSmall: TextStyle().copyWith(
      fontSize: AppSizes.fontLg,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),

    titleLarge: TextStyle().copyWith(
      fontSize: AppSizes.fontMd,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    titleMedium: TextStyle().copyWith(
      fontSize: AppSizes.fontMd,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    ),
    titleSmall: TextStyle().copyWith(
      fontSize: AppSizes.fontMd,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary,
    ),

    bodyLarge: TextStyle().copyWith(
      fontSize: AppSizes.fontSm,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: AppSizes.fontSm,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary,
    ),
    bodySmall: TextStyle().copyWith(
      fontSize: AppSizes.fontSm,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary.withOpacity(0.5),
    ),

    labelLarge: TextStyle().copyWith(
      fontSize: AppSizes.fontXs,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary,
    ),
    labelMedium: TextStyle().copyWith(
      fontSize: AppSizes.fontXs,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary.withOpacity(0.5),
    ),
  );

  static TextTheme darktTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(
      fontSize: AppSizes.font2Xl,
      fontWeight: FontWeight.bold,
      color: AppColors.textWhite,
    ),
    headlineMedium: TextStyle().copyWith(
      fontSize: AppSizes.fontXl,
      fontWeight: FontWeight.w600,
      color: AppColors.textWhite,
    ),
    headlineSmall: TextStyle().copyWith(
      fontSize: AppSizes.fontLg,
      fontWeight: FontWeight.w600,
      color: AppColors.textWhite,
    ),

    titleLarge: TextStyle().copyWith(
      fontSize: AppSizes.fontMd,
      fontWeight: FontWeight.w600,
      color: AppColors.textWhite,
    ),
    titleMedium: TextStyle().copyWith(
      fontSize: AppSizes.fontMd,
      fontWeight: FontWeight.w500,
      color: AppColors.textWhite,
    ),
    titleSmall: TextStyle().copyWith(
      fontSize: AppSizes.fontMd,
      fontWeight: FontWeight.w400,
      color: AppColors.textWhite,
    ),

    bodyLarge: TextStyle().copyWith(
      fontSize: AppSizes.fontSm,
      fontWeight: FontWeight.w500,
      color: AppColors.textWhite,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: AppSizes.fontSm,
      fontWeight: FontWeight.normal,
      color: AppColors.textWhite,
    ),
    bodySmall: TextStyle().copyWith(
      fontSize: AppSizes.fontSm,
      fontWeight: FontWeight.w500,
      color: AppColors.textWhite.withOpacity(0.5),
    ),

    labelLarge: TextStyle().copyWith(
      fontSize: AppSizes.fontXs,
      fontWeight: FontWeight.normal,
      color: AppColors.labelLight,
    ),
    labelMedium: TextStyle().copyWith(
      fontSize: AppSizes.fontXs,
      fontWeight: FontWeight.normal,
      color: AppColors.labelDark,
    ),
  );
}
