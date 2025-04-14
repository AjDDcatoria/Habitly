import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/strings/filters_constants.dart';
import 'package:habitly/src/data/model/habit_model.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

part 'habit_event.dart';
part 'habit_state.dart';

class HabitBloc extends Bloc<HabitEvent, HabitState> {
  HabitBloc() : super(HabitInitial()) {
    on<UpdateHabitStatus>(_onUpdatHabitStatus);
    on<OnDragHabitContainer>(_onDragHabitContainer);
    on<OnMounted>(_onMounted);
    on<UpdateFilter>(_onUpdateFilter);
  }

  void _onMounted(OnMounted event, Emitter<HabitState> emit) {
    emit(
      HabitUpdated(
        habits: state.habits,
        todoHabit:
            state.habits
                .where((habit) => habit.status == HabitStatus.todo)
                .toList(),
        completedHabit:
            state.habits
                .where((habit) => habit.status == HabitStatus.completed)
                .toList(),
        skippedHabits:
            state.habits
                .where((habit) => habit.status == HabitStatus.skipped)
                .toList(),
        hasMounted: true,
      ),
    );
  }

  void _onUpdatHabitStatus(UpdateHabitStatus event, Emitter<HabitState> emit) {
    final habit = state.habits.firstWhere((h) => h.id == event.habitId);
    habit.status = event.status;

    state.todoHabit.remove(habit);

    if (event.status == HabitStatus.completed) {
      state.completedHabit.insert(0, habit);
    } else {
      state.skippedHabits.insert(0, habit);
    }

    emit(
      HabitUpdated(
        habits: state.habits,
        todoHabit: state.todoHabit,
        skippedHabits: state.skippedHabits,
        completedHabit: state.completedHabit,
      ),
    );
  }

  void _onDragHabitContainer(
    OnDragHabitContainer event,
    Emitter<HabitState> emit,
  ) {
    Alignment? alignment;
    Color? bgColor;
    IconData? icon;
    String? title;

    if (event.direction == DismissDirection.startToEnd) {
      alignment = Alignment.centerLeft;
      bgColor = AppColors.success;
      icon = Icons.check;
      title = '';
    } else if (event.direction == DismissDirection.endToStart) {
      alignment = Alignment.centerRight;
      bgColor = AppColors.error;
      icon = Iconsax.arrow_right_1_copy;
      title = 'Skip';
    }

    emit(
      HabitUpdated(
        habits: state.habits,
        todoHabit: state.todoHabit,
        skippedHabits: state.skippedHabits,
        completedHabit: state.completedHabit,
        alignment: alignment,
        bgColor: bgColor,
        icon: icon,
        title: title,
      ),
    );
  }

  void _onUpdateFilter(UpdateFilter event, Emitter<HabitState> emit) {
    final habits = state.habits;

    List<Habit> filteredHabits = [];

    if (event.selectedFilter == HabitListFilters.repeate) {
      switch (event.selectedIndexFilter.toInt()) {
        case 0:
          filteredHabits =
              habits
                  .where((habit) => habit.repeate == HabitRepeate.daily)
                  .toList();
          break;
        case 1:
          filteredHabits =
              habits
                  .where((habit) => habit.repeate == HabitRepeate.weekly)
                  .toList();
          break;
        case 2:
          filteredHabits = habits;
          break;
        default:
          filteredHabits = [];
          break;
      }

      emit(
        HabitUpdated(
          habits: state.habits,
          todoHabit:
              filteredHabits
                  .where((habit) => habit.status == HabitStatus.todo)
                  .toList(),
          skippedHabits:
              filteredHabits
                  .where((habit) => habit.status == HabitStatus.skipped)
                  .toList(),
          completedHabit:
              filteredHabits
                  .where((habit) => habit.status == HabitStatus.completed)
                  .toList(),
          selectedRepeate: event.selectedIndexFilter,
          selectedSchedule: state.selectedSchedule,
        ),
      );
    } else if (event.selectedFilter == HabitListFilters.schedule) {
      switch (event.selectedIndexFilter.toInt()) {
        case 0:
          filteredHabits = habits;
          break;
        case 1:
          filteredHabits =
              habits
                  .where((habit) => habit.schedule == HabitSchedule.morning)
                  .toList();
          break;
        case 2:
          filteredHabits =
              habits
                  .where((habit) => habit.schedule == HabitSchedule.afternoon)
                  .toList();
          break;
        case 3:
          filteredHabits =
              habits
                  .where((habit) => habit.schedule == HabitSchedule.evening)
                  .toList();
          break;
        default:
          filteredHabits = [];
          break;
      }

      emit(
        HabitUpdated(
          habits: state.habits,
          todoHabit:
              filteredHabits
                  .where((habit) => habit.status == HabitStatus.todo)
                  .toList(),
          skippedHabits:
              filteredHabits
                  .where((habit) => habit.status == HabitStatus.skipped)
                  .toList(),
          completedHabit:
              filteredHabits
                  .where((habit) => habit.status == HabitStatus.completed)
                  .toList(),
          selectedRepeate: state.selectedRepeate,
          selectedSchedule: event.selectedIndexFilter,
        ),
      );
    }
  }
}
