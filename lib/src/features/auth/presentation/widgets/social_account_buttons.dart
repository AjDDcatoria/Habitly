import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitly/src/components/wide_container.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/constants/svg.dart';

class SocialAccountButtons extends StatelessWidget {
  const SocialAccountButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSizes.defaultBtwItems,
      children: [
        WideContainer(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(Svgs.google, width: 24, height: 24),
            label: Text('Continue with Google'),
          ),
        ),
        WideContainer(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(Svgs.apple, width: 24, height: 24),
            label: Text('Continue with Apple'),
          ),
        ),
        WideContainer(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(Svgs.facebook, width: 24, height: 24),
            label: Text('Continue with Facebook'),
          ),
        ),
        WideContainer(
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
