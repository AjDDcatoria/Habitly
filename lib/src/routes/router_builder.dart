import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:habitly/src/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:habitly/src/features/auth/presentation/screens/sign_up_screen.dart';
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
}
