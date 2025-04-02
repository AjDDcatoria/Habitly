import 'package:flutter/material.dart';

class WideContainer extends StatelessWidget {
  final Widget child;
  const WideContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity, child: child);
  }
}
