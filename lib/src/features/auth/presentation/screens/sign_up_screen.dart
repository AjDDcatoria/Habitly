import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitly/src/components/wide_container.dart';
import 'package:habitly/src/features/auth/presentation/widgets/footer_app_bar.dart';
import 'package:habitly/src/features/auth/presentation/widgets/social_account_buttons.dart';
import 'package:habitly/src/components/label_input.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/routes/routes_names.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isAgreeToTermsAndConditions = false;
  Color getColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColors.primary;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.paddingLg),
            child: Column(
              spacing: AppSizes.defaultBtwItems,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Join Habitly Today✨',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "Start your habit journey with Habitly. it's quick.\neasy, and free!",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                LabelInput(
                  label: 'Email',
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: 'Email',
                    ),
                  ),
                ),
                LabelInput(
                  label: 'Password',
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_open_sharp),
                      hintText: 'Password',
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      checkColor: AppColors.primary,
                      value: isAgreeToTermsAndConditions,
                      fillColor: WidgetStateProperty.resolveWith(getColor),
                      onChanged: (bool? value) {
                        setState(() {
                          isAgreeToTermsAndConditions = value!;
                        });
                      },
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'I agree to Habitly',
                        style: Theme.of(context).textTheme.titleSmall,
                        children: [
                          TextSpan(
                            text: ' Terms & Conditions.',
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: 'Already have an account? ',
                      style: Theme.of(context).textTheme.titleSmall,
                      children: [
                        TextSpan(
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () => context.push(RouteNames.signin),
                          text: 'Sign in',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  spacing: AppSizes.defaultBtwItems,
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        height: 50.0,
                        color: AppColors.lightBorder,
                      ),
                    ),
                    Text('or', style: Theme.of(context).textTheme.titleSmall),
                    Expanded(
                      child: Divider(
                        height: 50.0,
                        color: AppColors.lightBorder,
                      ),
                    ),
                  ],
                ),
                SocialAccountButtons(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: FooterAppBar(
        child: WideContainer(
          child: ElevatedButton(
            onPressed: () => context.push(RouteNames.signupStep),
            child: Text('Sign up'),
          ),
        ),
      ),
    );
  }
}
