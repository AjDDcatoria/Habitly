import 'package:go_router/go_router.dart';
import 'package:habitly/src/routes/routes_names.dart';
import 'package:habitly/src/routes/router_builder.dart';
import 'package:flutter/material.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: RouteNames.walkthrough,
      builder: AppRouteBuilder.walkThrought,
    ),
    GoRoute(path: RouteNames.welcome, builder: AppRouteBuilder.welcomeScreen),
    GoRoute(path: RouteNames.home, builder: AppRouteBuilder.homeScreen),
    GoRoute(path: RouteNames.signin, builder: AppRouteBuilder.signInScreen),
    GoRoute(path: RouteNames.signup, builder: AppRouteBuilder.signUpScreen),
    GoRoute(
      path: RouteNames.signupStep,
      builder: AppRouteBuilder.signUpStepsScreen,
    ),
  ],
  redirect: (context, state) => null,
  errorBuilder:
      (context, state) =>
          const Scaffold(body: Center(child: Text('404 - Page not found'))),
);
