import 'package:flutter/material.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AppBarIndicator extends StatelessWidget implements PreferredSizeWidget {
  final double currentPercent;
  final int totalPages;
  final int currentPage;

  const AppBarIndicator({
    super.key,
    required this.currentPercent,
    required this.totalPages,
    required this.currentPage,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: LinearPercentIndicator(
        barRadius: Radius.circular(AppSizes.borderRadiusLg),
        lineHeight: 15.0,
        percent: currentPercent,
        progressColor: AppColors.primary,
        backgroundColor: AppColors.labelDark,
      ),
      actions: [
        Text(
          '${currentPage + 1} / $totalPages',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
      actionsPadding: EdgeInsets.only(right: AppSizes.paddingLg),
    );
  }
}
