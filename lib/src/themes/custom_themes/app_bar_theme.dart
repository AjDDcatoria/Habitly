import 'package:flutter/material.dart';
import 'package:habitly/src/constants/colors.dart';

class AppAppBarTheme {
  AppAppBarTheme._();

  static final lightAppBar = AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.light,
    scrolledUnderElevation: 0,
  );
}
