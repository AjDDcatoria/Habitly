import 'package:dartz/dartz.dart';
import 'package:habitly/src/data/response/failure.dart';
import 'package:habitly/src/data/model/habit_model.dart';
import 'package:habitly/src/data/services/habit_service.dart';

class HabitRepository {
  final HabitService _habitService;

  HabitRepository(this._habitService);

  Future<Either<List<Habit>, Failure>> fetchHabit() async {
    try {
      final habitData = await _habitService.fetchHabit();
      return Left(habitData);
    } catch (e) {
      return Right(Failure(e));
    }
  }

  Future<Either<Habit, Failure>> createHabit(Habit habit) async {
    try {
      final Habit newHabit = await _habitService.createHabit(habit);
      return Left(newHabit);
    } catch (e) {
      return Right(Failure(e));
    }
  }

  Future<Either<Habit, Failure>> getHabitById(String id) async {
    try {
      final Habit habit = await _habitService.getHabitById(id);
      return Left(habit);
    } catch (e) {
      return Right(Failure(e));
    }
  }

  Future<Either<void, Failure>> deleteHabit(String id) async {
    try {
      await _habitService.deleteHabit(id);
      return Left(null);
    } catch (e) {
      return Right(Failure(e));
    }
  }
}
