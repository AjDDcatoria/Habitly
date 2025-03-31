import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitly/src/common/social_account_buttons.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/images.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/routes/routes_names.dart';
import 'package:habitly/src/themes/theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonTheme = Theme.of(context).extension<SecondaryButtonTheme>()!;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.paddingLg,
              vertical: AppSizes.paddingXl,
            ),
            child: Center(
              child: Column(
                spacing: AppSizes.defaultBtwSections,
                children: <Widget>[
                  Image.asset(Images.logo, height: 90.0),
                  Text(
                    "Let's Get Started!",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    "Let's dive in into your account",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  socialAccountButtons(),
                  _controlButtons(context, buttonTheme),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.light,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Privacy Policy',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            Text('•', style: Theme.of(context).textTheme.labelLarge),
            TextButton(
              onPressed: () {},
              child: Text(
                'Terms of Service',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _controlButtons(
    BuildContext context,
    SecondaryButtonTheme buttonTheme,
  ) {
    return Column(
      spacing: AppSizes.defaultBtwItems,
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => context.push(RouteNames.signup),
            child: Text('Sign up'),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => context.push(RouteNames.signin),
            style: buttonTheme.secondary.style,
            child: Text('Sign in'),
          ),
        ),
      ],
    );
  }
}
