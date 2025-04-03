import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:habitly/src/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:habitly/src/features/auth/presentation/screens/new_password_screen.dart';
import 'package:habitly/src/features/auth/presentation/screens/otp_code.screen.dart';
import 'package:habitly/src/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:habitly/src/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:habitly/src/features/auth/presentation/screens/sign_up_steps_screen.dart';
import 'package:habitly/src/features/home/presentation/screens/home_screen.dart';
import 'package:habitly/src/features/started/screens/walk_through.dart';
import 'package:habitly/src/features/started/screens/welcome_screen.dart';

class AppRouteBuilder {
  static Widget walkThrought(BuildContext context, GoRouterState state) {
    return const WalkThrough();
  }

  static Widget welcomeScreen(BuildContext context, GoRouterState state) {
    return const WelcomeScreen();
  }

  static Widget homeScreen(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }

  static Widget signInScreen(BuildContext context, GoRouterState state) {
    return const SignInScreen();
  }

  static Widget signUpScreen(BuildContext context, GoRouterState state) {
    return const SignUpScreen();
  }

  static Widget signUpStepsScreen(BuildContext context, GoRouterState state) {
    return const SignUpStepScreens();
  }

  static Widget forgotPasswordScreeen(
    BuildContext context,
    GoRouterState state,
  ) {
    return const ForgotPasswordScreen();
  }

  static Widget otpCodeScreen(BuildContext context, GoRouterState state) {
    return const OtpCodeScreen();
  }

  static Widget newPasswordScreen(BuildContext context, GoRouterState state) {
    return const NewPasswordScreen();
  }
}
