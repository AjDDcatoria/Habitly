part of 'habit_bloc.dart';

@immutable
sealed class HabitEvent {}

class UpdateHabitStatus extends HabitEvent {
  final String habitId;
  final HabitStatus status;

  UpdateHabitStatus(this.habitId, this.status);
}

class OnDragHabitContainer extends HabitEvent {
  final DismissDirection direction;

  OnDragHabitContainer(this.direction);
}

class OnMounted extends HabitEvent {}

class UpdateFilter extends HabitEvent {
  final int selectedIndexFilter;
  final HabitListFilters selectedFilter;

  UpdateFilter(this.selectedIndexFilter, this.selectedFilter);
}

class OnAddHabit extends HabitEvent {
  final Habit habit;

  OnAddHabit(this.habit);
}

class GetHabitById extends HabitEvent {
  final String habitId;

  GetHabitById(this.habitId);
}

class OnDeleteHabit extends HabitEvent {
  final String habitId;

  OnDeleteHabit(this.habitId);
}

class OnUpdateHabit extends HabitEvent {
  final Habit habit;

  OnUpdateHabit(this.habit);
}

class OnFetchCurrentScheduleHabit extends HabitEvent {}
