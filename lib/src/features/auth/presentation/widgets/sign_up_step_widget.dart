import 'package:flutter/material.dart';
import 'package:habitly/src/constants/sizes.dart';

class StepPageWidget extends StatefulWidget {
  final Widget title;
  final Widget subtitle;
  final Widget content;

  const StepPageWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.content,
  });

  @override
  State<StepPageWidget> createState() => _StepPageWidgetState();
}

class _StepPageWidgetState extends State<StepPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.paddingLg),
      child: Column(
        spacing: AppSizes.defaultBtwSections,
        children: <Widget>[widget.title, widget.subtitle, widget.content],
      ),
    );
  }
}
