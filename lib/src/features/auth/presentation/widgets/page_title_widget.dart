import 'package:flutter/material.dart';
import 'package:habitly/src/constants/colors.dart';

class PageTitle extends StatelessWidget {
  final String fTitle;
  final String hTitle;
  final String lTitle;

  const PageTitle({
    super.key,
    required this.fTitle,
    required this.hTitle,
    required this.lTitle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      softWrap: true,
      textAlign: TextAlign.center,
      text: TextSpan(
        text: fTitle,
        style: Theme.of(context).textTheme.headlineLarge,
        children: <TextSpan>[
          TextSpan(text: hTitle, style: TextStyle(color: AppColors.primary)),
          TextSpan(text: lTitle),
        ],
      ),
    );
  }
}
