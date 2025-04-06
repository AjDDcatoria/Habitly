import 'package:flutter/material.dart';
import 'package:habitly/src/constants/sizes.dart';

class HomePageFilterToggleWidget extends StatelessWidget {
  final List<String> labels;
  final int currentIndex;
  final Function onPressed;

  const HomePageFilterToggleWidget({
    super.key,
    required this.labels,
    required this.currentIndex,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingLg),
      child: Row(
        spacing: AppSizes.defaultBtwItems,
        children: List.generate(labels.length, (index) {
          return index == currentIndex
              ? ElevatedButton(
                onPressed: () => onPressed(index),
                child: Text(labels[index].toString()),
              )
              : OutlinedButton(
                onPressed: () => onPressed(index),
                child: Text(labels[index].toString()),
              );
        }),
      ),
    );
  }
}
