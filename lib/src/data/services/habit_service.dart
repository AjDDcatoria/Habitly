import 'package:habitly/src/data/model/habit_model.dart';
import 'package:intl/intl.dart';
import 'package:localstore/localstore.dart';

class HabitService {
  final db = Localstore.instance;

  Future<List<Habit>> fetchCurrentScheduleHabit() async {
    String currentDay = DateFormat('EEEE').format(DateTime.now());
    final habitCollections = await db.collection('habits').get();
    if (habitCollections == null) return [];

    late List<Habit> habitList = [];

    habitCollections.forEach((key, value) async {
      final data = value;

      final repeatValues = List<String>.from(data['repeateValues'] ?? []);

      if (repeatValues.contains(currentDay.toLowerCase())) {
        habitList.add(Habit.fromJson(data));
      }
    });
    return habitList;
  }

  Future<List<Habit>> fetchHabit() async {
    final habitCollections = await db.collection('habits').get();

    if (habitCollections == null) return [];

    return habitCollections.entries.map((entry) {
      final data = entry.value;
      return Habit.fromJson(data);
    }).toList();
  }

  Future<Habit> createHabit(Habit habit) async {
    final id = db.collection('habits').doc().id;
    habit.id = id;

    db.collection('habits').doc(id).set(habit.toJson());

    return habit;
  }

  Future<Habit> getHabitById(String id) async {
    final habit = await db.collection('habits').doc(id).get();

    if (habit == null) throw Exception('Habit not found');

    return Habit.fromJson(habit);
  }

  Future<void> deleteHabit(String id) async {
    await db.collection('habits').doc(id).delete();
  }

  Future<void> updateHabit(Habit habit) async {
    await db.collection('habits').doc(habit.id).set(habit.toJson());
  }

  Future<void> updateHabitStatus(String id, HabitStatus status) async {
    final habit = await db.collection('habits').doc(id).get();

    if (habit == null) throw Exception('Habit not found');

    habit['status'] = status.name;

    await db.collection('habits').doc(id).set(habit);
  }
}
