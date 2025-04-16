import 'package:flutter/material.dart';
import 'package:habitly/src/constants/sizes.dart';

class HomePageFilterToggleWidget extends StatelessWidget {
  final List<String> labels;
  final int currentIndex;
  final Function onPressed;
  final double? horizontalPadding;
  final double? verticalPadding;

  const HomePageFilterToggleWidget({
    super.key,
    required this.labels,
    required this.currentIndex,
    required this.onPressed,
    this.horizontalPadding,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingLg),
      child: Wrap(
        spacing: AppSizes.defaultBtwItems,
        children: List.generate(labels.length, (index) {
          return index == currentIndex
              ? ElevatedButton(
                onPressed: () => onPressed(index),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding ?? AppSizes.paddingLg,
                    vertical: verticalPadding ?? AppSizes.paddingLg,
                  ),
                ),
                child: Text(labels[index].toString()),
              )
              : OutlinedButton(
                onPressed: () => onPressed(index),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding ?? AppSizes.paddingLg,
                    vertical: verticalPadding ?? AppSizes.paddingLg,
                  ),
                ),
                child: Text(labels[index].toString()),
              );
        }),
      ),
    );
  }
}
