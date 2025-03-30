import 'package:flutter/material.dart';
import 'package:habitly/src/constants/sizes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.paddingLg),
            child: Column(
              children: <Widget>[
                Text("Let's Get Started!"),
                Text("Let's dive in into your account"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
