import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/constants/svg.dart';

class SocialAccountButtons extends StatelessWidget {
  const SocialAccountButtons({super.key});

  @override
  Widget build(BuildContext context) {
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
