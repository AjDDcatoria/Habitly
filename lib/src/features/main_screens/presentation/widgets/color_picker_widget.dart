import 'package:flutter/material.dart';
import 'package:habitly/src/components/label_input.dart';
import 'package:habitly/src/constants/colors.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return LabelInput(
      label: 'Colors',
      child: SizedBox(
        height: 240,
        child: GridView.count(
          crossAxisCount: 5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          physics: NeverScrollableScrollPhysics(),
          children:
              colorList.map((color) {
                return Container(
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                  margin: EdgeInsets.all(4),
                );
              }).toList(),
        ),
      ),
    );
  }
}
