class Habit {
  String id;
  String title;
  String icon;
  String bgColor;
  HabitStatus status;
  HabitSchedule schedule;
  HabitRepeate repeate;
  List<dynamic> repeateValues;
  bool reminder;

  Habit({
    this.id = '',
    required this.title,
    required this.icon,
    required this.bgColor,
    required this.status,
    required this.schedule,
    required this.repeate,
    required this.repeateValues,
    required this.reminder,
  });
}

enum HabitStatus { todo, skipped, completed }

enum HabitSchedule { morning, afternoon, evening }

enum HabitRepeate { daily, weekly, monthly }
