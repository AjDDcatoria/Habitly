import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:habitly/src/data/model/habit_model.dart';

class HabitService {
  Future<List<Habit>> fetchHabit() async {
    final String jsonHabit = await rootBundle.loadString(
      'assets/data/habit.json',
    );
    final Map<String, dynamic> data = jsonDecode(jsonHabit);
    final List<dynamic> habitList = data['habits'];
    return habitList.map((habitJson) => Habit.fromJson(habitJson)).toList();
  }
}
