import 'package:flutter/material.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberScrollPicker extends StatelessWidget {
  final int currentValue;
  final int minValue;
  final int maxValue;
  final double width;
  final ValueChanged<int> onChange;

  const NumberScrollPicker({
    super.key,
    required this.currentValue,
    required this.onChange,
    required this.minValue,
    required this.maxValue,
    this.width = 50,
  });

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      textStyle: Theme.of(context).textTheme.headlineLarge,
      selectedTextStyle: TextStyle(
        color: AppColors.primary,
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: AppColors.primary),
        ),
      ),
      value: currentValue,
      itemHeight: 65.0,
      itemWidth: width,
      zeroPad: true,
      itemCount: 7,
      minValue: minValue,
      maxValue: maxValue,
      step: 1,
      infiniteLoop: true,
      haptics: false,
      onChanged: onChange,
    );
  }
}
