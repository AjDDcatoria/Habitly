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

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      id: json['id'],
      title: json['title'],
      icon: json['icon'],
      bgColor: json['bgColor'],
      status: _stringToStatus(json['status']),
      schedule: _stringToSchedule(json['schedule']),
      repeate: _stringToRepeate(json['repeate']),
      repeateValues: json['repeateValues'],
      reminder: json['reminder'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'icon': icon,
      'bgColor': bgColor,
      'status': _statusToString(status),
      'schedule': _scheduleToString(schedule),
      'repeate': _repeateToString(repeate),
      'repeateValues': repeateValues,
      'reminder': reminder,
    };
  }

  static HabitStatus _stringToStatus(String value) {
    switch (value) {
      case 'todo':
        return HabitStatus.todo;
      case 'skipped':
        return HabitStatus.skipped;
      case 'completed':
        return HabitStatus.completed;
      default:
        throw Exception('Unknown HabitStatus: $value');
    }
  }

  static HabitSchedule _stringToSchedule(String value) {
    switch (value) {
      case 'morning':
        return HabitSchedule.morning;
      case 'afternoon':
        return HabitSchedule.afternoon;
      case 'evening':
        return HabitSchedule.evening;
      default:
        throw Exception('Unknown HabitSchedule: $value');
    }
  }

  static HabitRepeate _stringToRepeate(String value) {
    switch (value) {
      case 'daily':
        return HabitRepeate.daily;
      case 'weekly':
        return HabitRepeate.weekly;
      case 'monthly':
        return HabitRepeate.monthly;
      default:
        throw Exception('Unknown HabitRepeate: $value');
    }
  }

  static String _statusToString(HabitStatus status) {
    switch (status) {
      case HabitStatus.todo:
        return 'todo';
      case HabitStatus.skipped:
        return 'skipped';
      case HabitStatus.completed:
        return 'completed';
    }
  }

  static String _scheduleToString(HabitSchedule schedule) {
    switch (schedule) {
      case HabitSchedule.morning:
        return 'morning';
      case HabitSchedule.afternoon:
        return 'afternoon';
      case HabitSchedule.evening:
        return 'evening';
    }
  }

  static String _repeateToString(HabitRepeate repeate) {
    switch (repeate) {
      case HabitRepeate.daily:
        return 'daily';
      case HabitRepeate.weekly:
        return 'weekly';
      case HabitRepeate.monthly:
        return 'monthly';
    }
  }
}

enum HabitStatus { todo, skipped, completed }

enum HabitSchedule { morning, afternoon, evening }

enum HabitRepeate { daily, weekly, monthly }
