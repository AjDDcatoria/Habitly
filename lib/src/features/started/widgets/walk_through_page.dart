import 'package:flutter/material.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';

class WalkThroughPageWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const WalkThroughPageWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Transform.scale(
          scale: 7,
          origin: Offset(0, 55),
          child: Stack(
            children: [
              Container(
                height: 210,
                width: 62,
                decoration: BoxDecoration(color: AppColors.primary),
              ),
              Positioned(
                top: 150,
                left: -6,
                child: Image.asset(imagePath, height: 130),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 65.0),
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
