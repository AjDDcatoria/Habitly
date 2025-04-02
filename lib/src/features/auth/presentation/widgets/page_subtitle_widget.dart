import 'package:flutter/material.dart';

class PageSubtitle extends StatelessWidget {
  final String subtitle;
  const PageSubtitle({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      softWrap: true,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
