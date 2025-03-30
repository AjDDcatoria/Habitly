import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/images.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/constants/svg.dart';
import 'package:habitly/src/routes/routes_names.dart';
import 'package:habitly/src/themes/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                  _socialButtons(),
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

  Column _socialButtons() {
    return Column(
      spacing: AppSizes.defaultBtwItems,
      children: [
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(Svgs.google, width: 24, height: 24),
            label: Text('Continue with Google'),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(Svgs.apple, width: 24, height: 24),
            label: Text('Continue with Apple'),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(Svgs.facebook, width: 24, height: 24),
            label: Text('Continue with Facebook'),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(Svgs.instagram, width: 24, height: 24),
            label: Text('Continue with Instagram'),
          ),
        ),
      ],
    );
  }
}
