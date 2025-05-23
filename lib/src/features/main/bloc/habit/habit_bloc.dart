import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/strings/habit_constants.dart';
import 'package:habitly/src/data/response/failure.dart';
import 'package:habitly/src/data/model/habit_model.dart';
import 'package:habitly/src/data/repositories/habit_repo.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

part 'habit_event.dart';
part 'habit_state.dart';

class HabitBloc extends Bloc<HabitEvent, HabitState> {
  final HabitRepository _habitRepository;

  HabitBloc(this._habitRepository) : super(HabitInitial()) {
    on<UpdateHabitStatus>(_onUpdatHabitStatus);
    on<OnDragHabitContainer>(_onDragHabitContainer);
    on<OnMounted>(_onMounted);
    on<UpdateFilter>(_onUpdateFilter);
    on<OnAddHabit>(_onAddHabit);
    on<GetHabitById>(_getHabitById);
    on<OnDeleteHabit>(_onDeleteHabit);
    on<OnUpdateHabit>(_onUpdateHabit);
    on<OnFetchCurrentScheduleHabit>(_onFetchCurrentScheduleHabit);
  }

  void _onFetchCurrentScheduleHabit(
    OnFetchCurrentScheduleHabit event,
    Emitter<HabitState> emit,
  ) async {
    final response = await _habitRepository.fetchCurrentScheduleHabit();
    response.fold(
      (List<Habit> habitList) {
        emit(
          HabitUpdated(
            habits: state.habits,
            currentScheduleHabit: habitList,
            todoHabit:
                habitList
                    .where((habit) => habit.status == HabitStatus.todo)
                    .toList(),
            completedHabit:
                habitList
                    .where((habit) => habit.status == HabitStatus.completed)
                    .toList(),
            skippedHabits:
                habitList
                    .where((habit) => habit.status == HabitStatus.skipped)
                    .toList(),
          ),
        );
      },
      (Failure error) {
        print(error.message);
      },
    );
  }

  void _onAddHabit(OnAddHabit event, Emitter<HabitState> emit) async {
    final response = await _habitRepository.createHabit(event.habit);
    response.fold((Habit newHabit) {
      state.habits.add(newHabit);
      state.todoHabit.add(newHabit);
      emit(
        HabitUpdated(
          habits: state.habits,
          todoHabit: state.todoHabit,
          skippedHabits: state.skippedHabits,
          completedHabit: state.completedHabit,
        ),
      );
    }, (Failure error) => print(error));
  }

  void _onMounted(OnMounted event, Emitter<HabitState> emit) async {
    final response = await _habitRepository.fetchHabit();

    response.fold(
      (List<Habit> habitList) {
        emit(HabitUpdated(habits: habitList));
      },
      (Failure error) {
        print(error.message);
      },
    );
  }

  void _onUpdatHabitStatus(
    UpdateHabitStatus event,
    Emitter<HabitState> emit,
  ) async {
    final response = await _habitRepository.updateHabitStatus(
      event.habitId,
      event.status,
    );

    response.fold(
      (void _) {
        final habit = state.currentScheduleHabit.firstWhere(
          (h) => h.id == event.habitId,
        );
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
            currentScheduleHabit: state.currentScheduleHabit,
            todoHabit: state.todoHabit,
            skippedHabits: state.skippedHabits,
            completedHabit: state.completedHabit,
          ),
        );
      },
      (Failure error) {
        print(error.message);
      },
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
        currentScheduleHabit: state.currentScheduleHabit,
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
    final habits = state.currentScheduleHabit;

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
          currentScheduleHabit: state.currentScheduleHabit,
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
          currentScheduleHabit: state.currentScheduleHabit,
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

  _getHabitById(GetHabitById event, Emitter<HabitState> emit) async {
    final response = await _habitRepository.getHabitById(event.habitId);

    response.fold(
      (Habit habit) {
        emit(
          HabitUpdated(
            habits: state.habits,
            todoHabit: state.todoHabit,
            skippedHabits: state.skippedHabits,
            completedHabit: state.completedHabit,
            selectedViewHabit: habit,
          ),
        );
      },
      (Failure error) {
        print(error.message);
      },
    );
  }

  _onDeleteHabit(OnDeleteHabit event, Emitter<HabitState> emit) async {
    final response = await _habitRepository.deleteHabit(event.habitId);
    response.fold(
      (void _) {
        state.habits.removeWhere((habit) => habit.id == event.habitId);
        state.todoHabit.removeWhere((habit) => habit.id == event.habitId);
        state.skippedHabits.removeWhere((habit) => habit.id == event.habitId);
        state.completedHabit.removeWhere((habit) => habit.id == event.habitId);
        state.currentScheduleHabit.removeWhere(
          (habit) => habit.id == event.habitId,
        );

        emit(
          HabitUpdated(
            habits: state.habits,
            currentScheduleHabit: state.currentScheduleHabit,
            todoHabit: state.todoHabit,
            skippedHabits: state.skippedHabits,
            completedHabit: state.completedHabit,
          ),
        );
      },
      (Failure error) {
        print(error.message);
      },
    );
  }

  _onUpdateHabit(OnUpdateHabit event, Emitter<HabitState> emit) async {
    final response = await _habitRepository.updateHabit(event.habit);

    response.fold(
      (void _) {
        state.habits.removeWhere((habit) => habit.id == event.habit.id);
        state.habits.add(event.habit);

        emit(
          HabitUpdated(
            habits: state.habits,
            todoHabit: state.todoHabit,
            skippedHabits: state.skippedHabits,
            completedHabit: state.completedHabit,
          ),
        );
      },
      (Failure error) {
        print(error.message);
      },
    );
  }
}
