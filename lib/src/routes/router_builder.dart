import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:habitly/src/features/main/presentation/pages/create_new_habit_page.dart';
import 'package:habitly/src/features/main/presentation/pages/view_habit_page.dart';
import 'package:habitly/src/features/main/presentation/screens/main_screen.dart';
import 'package:habitly/src/features/started/screens/walk_through.dart';

class AppRouteBuilder {
  static Widget walkThrought(BuildContext context, GoRouterState state) {
    return const WalkThrough();
  }

  static Widget mainScreen(BuildContext context, GoRouterState state) {
    return const MainScreen();
  }

  static Widget createNewHabit(BuildContext context, GoRouterState state) {
    return const CreateNewHabitPage();
  }

  static Widget viewHabit(BuildContext context, GoRouterState state) {
    return const ViewHabitPage();
  }
}
