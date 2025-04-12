import 'package:flutter/material.dart';
import 'package:habitly/src/components/label_input.dart';
import 'package:habitly/src/constants/colors.dart';

class ColorPicker extends StatelessWidget {
  final int? selected;
  final Function onTap;

  const ColorPicker({super.key, this.selected, required this.onTap});

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
          children: List.generate(colorList.length, (int index) {
            return GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                decoration: BoxDecoration(
                  color: colorList[index],
                  shape: BoxShape.circle,
                ),
                margin: EdgeInsets.all(4),
                child: Center(
                  child:
                      selected == index ? Icon(Icons.check, size: 30.0) : null,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
