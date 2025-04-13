part of 'habit_bloc.dart';

@immutable
sealed class HabitState {
  // List of Habit states
  final List<Habit> habits;
  final List<Habit> todoHabit;
  final List<Habit> skippedHabits;
  final List<Habit> completedHabit;

  final bool hasMounted;

  final int selectedRepeate;
  final int selectedSchedule;

  // UI State
  final Color? bgColor;
  final Alignment? alignment;
  final IconData? icon;
  final String? title;

  const HabitState({
    this.habits = const [],
    this.skippedHabits = const [],
    this.completedHabit = const [],
    this.todoHabit = const [],
    this.selectedRepeate = 0,
    this.selectedSchedule = 0,
    this.hasMounted = false,
    this.bgColor,
    this.alignment,
    this.icon,
    this.title,
  });
}

final class HabitInitial extends HabitState {
  HabitInitial()
    : super(
        habits: [
          Habit(
            id: '1',
            title: 'Set Small Goals',
            icon: '🎯',
            bgColor: 'creamOrange',
            status: HabitStatus.todo,
            schedule: HabitSchedule.morning,
            repeate: HabitRepeate.daily,
            repeateValues: ['M', 'F'],
            reminder: true,
          ),
          Habit(
            id: '2',
            title: 'Work',
            icon: '🏆',
            bgColor: 'periwinkle',
            status: HabitStatus.todo,
            schedule: HabitSchedule.morning,
            repeate: HabitRepeate.weekly,
            repeateValues: ['M', 'F'],
            reminder: true,
          ),
          Habit(
            id: '3',
            title: 'Meditation',
            icon: '😇',
            bgColor: 'mintGreen',
            status: HabitStatus.skipped,
            schedule: HabitSchedule.afternoon,
            repeate: HabitRepeate.weekly,
            repeateValues: ['M', 'F'],
            reminder: true,
          ),
          Habit(
            id: '4',
            title: 'Basketball',
            icon: '🏀',
            bgColor: 'peach',
            status: HabitStatus.completed,
            schedule: HabitSchedule.evening,
            repeate: HabitRepeate.daily,
            repeateValues: ['M', 'F'],
            reminder: true,
          ),
        ],
        completedHabit: [],
        todoHabit: [],
        skippedHabits: [],
        hasMounted: false,
        selectedRepeate: 0,
        selectedSchedule: 0,
      );
}

final class HabitUpdated extends HabitState {
  const HabitUpdated({
    super.habits,
    super.todoHabit,
    super.completedHabit,
    super.skippedHabits,
    super.hasMounted,
    super.alignment,
    super.bgColor,
    super.icon,
    super.title,
    super.selectedRepeate,
    super.selectedSchedule,
  });
}
