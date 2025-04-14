import 'package:habitly/src/features/main/presentation/pages/create_new_habit_page.dart';

final List<String> habitRepeateFilters = ['Today', 'Weekly', 'Overall'];
final List<String> habitScheduleFilters = [
  'All',
  'Morning',
  'Afternoon',
  'Evening',
];

final List<String> habitRepeateList = ['Daily', 'Weekly', 'Monthly'];
final List<DayTitles> habitdaysOfTheWeeksList = [
  DayTitles(title: 'S', label: 'sunday'),
  DayTitles(title: 'M', label: 'monday'),
  DayTitles(title: 'T', label: 'tuesday'),
  DayTitles(title: 'W', label: 'wedsday'),
  DayTitles(title: 'T', label: 'thursday'),
  DayTitles(title: 'F', label: 'friday'),
  DayTitles(title: 'S', label: 'saturday'),
];

Set dayList = {
  'sunday',
  'monday',
  'tuesday',
  'wedsday',
  'thursday',
  'friday',
  'saturday',
};

final List<String> habitnumberOfDaysList = ['1', '2', '3', '4', '5', '6', '7'];

final List<String> habitScheduleList = ['Morning', 'Afternoon', 'Evening'];

enum HabitListFilters { repeate, schedule }

enum RepeateFilter { today, weekly, overall }

enum ScheduleFilter { all, morning, afternnon, evening }
