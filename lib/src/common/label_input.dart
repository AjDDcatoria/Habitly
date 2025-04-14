import 'package:flutter/material.dart';
import 'package:habitly/src/constants/sizes.dart';

class LabelInput extends StatefulWidget {
  final String label;
  final Widget child;

  const LabelInput({super.key, required this.label, required this.child});

  @override
  State<LabelInput> createState() => _LabelInputState();
}

class _LabelInputState extends State<LabelInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSizes.defaultBtwItems,
      children: <Widget>[
        Text(widget.label, style: Theme.of(context).textTheme.bodyLarge),
        widget.child,
      ],
    );
  }
}
