import 'package:flutter/material.dart';
import 'package:habitly/app.dart';
import 'package:habitly/src/data/repositories/habit_repo.dart';
import 'package:habitly/src/data/services/habit_service.dart';

void main() {
  final HabitService habitService = HabitService();
  final HabitRepository habitRepository = HabitRepository(habitService);
  runApp(App(habitRepository: habitRepository));
}
