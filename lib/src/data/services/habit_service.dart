import 'package:habitly/src/data/model/habit_model.dart';
import 'package:localstore/localstore.dart';

class HabitService {
  final db = Localstore.instance;

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
}
