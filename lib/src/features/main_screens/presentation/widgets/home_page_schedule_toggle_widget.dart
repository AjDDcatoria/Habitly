import 'package:flutter/material.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomePageScheduleToggleWidget extends StatelessWidget {
  final int currentIndex;
  final List<String> labels;
  final Function onToggle;

  const HomePageScheduleToggleWidget({
    super.key,
    required this.currentIndex,
    required this.labels,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingLg),
      child: ToggleSwitch(
        initialLabelIndex: currentIndex,
        minHeight: 55.0,
        fontSize: 15,
        minWidth: double.infinity,
        inactiveBgColor: AppColors.lightGrey,
        activeFgColor: Colors.white,
        totalSwitches: labels.length,
        customTextStyles: [TextStyle(fontWeight: FontWeight.w600)],
        labels: labels,
        onToggle: (index) => onToggle(index),
      ),
    );
  }
}
