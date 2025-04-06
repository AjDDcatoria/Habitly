import 'package:flutter/material.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomePageToggleWidget extends StatefulWidget {
  final int currentIndex;
  final List<String> labels;

  const HomePageToggleWidget({
    super.key,
    required this.currentIndex,
    required this.labels,
  });

  @override
  State<HomePageToggleWidget> createState() => _HomePageToggleWidgetState();
}

class _HomePageToggleWidgetState extends State<HomePageToggleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingLg),
      child: ToggleSwitch(
        initialLabelIndex: 0,
        minHeight: 55.0,
        fontSize: 15,
        minWidth: double.infinity,
        inactiveBgColor: AppColors.lightGrey,
        activeFgColor: Colors.white,
        totalSwitches: widget.labels.length,
        customTextStyles: [TextStyle(fontWeight: FontWeight.w600)],
        labels: widget.labels,
        onToggle: (index) {},
      ),
    );
  }
}
