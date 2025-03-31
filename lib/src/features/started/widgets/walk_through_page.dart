import 'package:flutter/material.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';

class WalkThroughPageWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const WalkThroughPageWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Transform.scale(
          scale: 7,
          origin: Offset(0, 55),
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(300),
            ),
          ),
        ),
        Container(
          height: 250,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            spacing: AppSizes.defaultBtwItems,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineLarge,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.titleMedium,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
