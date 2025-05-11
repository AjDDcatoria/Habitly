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
    GoRoute(path: RouteNames.mainScreen, builder: AppRouteBuilder.mainScreen),
    GoRoute(
      path: RouteNames.createNewHabit,
      builder: AppRouteBuilder.createNewHabit,
    ),
    GoRoute(path: RouteNames.viewHabit, builder: AppRouteBuilder.viewHabit),
  ],
  redirect: (context, state) => null,
  errorBuilder:
      (context, state) =>
          const Scaffold(body: Center(child: Text('404 - Page not found'))),
);
