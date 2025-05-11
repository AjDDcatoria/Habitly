part of 'habit_bloc.dart';

@immutable
sealed class HabitState {
  // List of Habit states
  final List<Habit> habits;
  final List<Habit> todoHabit;
  final List<Habit> skippedHabits;
  final List<Habit> completedHabit;
  final Habit? selectedViewHabit;

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
    this.selectedViewHabit,
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
        habits: [],
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
    super.selectedViewHabit,
    super.hasMounted,
    super.alignment,
    super.bgColor,
    super.icon,
    super.title,
    super.selectedRepeate,
    super.selectedSchedule,
  });
}
