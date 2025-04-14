import 'package:flutter/material.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';

class FooterAppBar extends StatelessWidget {
  final Widget child;

  const FooterAppBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.light,
      height: 85.0,
      padding: EdgeInsets.all(0),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingLg,
          vertical: AppSizes.paddingLg,
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey[300]!, // Border color
              width: 1.0, // Border thickness
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
