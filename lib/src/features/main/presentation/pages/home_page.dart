import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/constants/strings/habit_constants.dart';
import 'package:habitly/src/features/main/bloc/habit/habit_bloc.dart';
import 'package:habitly/src/features/main/presentation/widgets/current_habitlist_widget.dart';
import 'package:habitly/src/features/main/presentation/widgets/home_page_filter_toggle_widget.dart';
import 'package:habitly/src/features/main/presentation/widgets/labeled_habitslist_widget.dart';
import 'package:habitly/src/features/main/presentation/widgets/main_screen_appbar_widget.dart';
import 'package:habitly/src/data/model/habit_model.dart';
import 'package:habitly/src/routes/routes_names.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HabitBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<HabitBloc>();
    bloc.add(OnFetchCurrentScheduleHabit());
  }

  void onDrag(DismissUpdateDetails direction) {
    bloc.add(OnDragHabitContainer(direction.direction));
  }

  void onDismissed(
    DismissDirection direction,
    int index,
    List<Habit> habitList,
  ) {
    final habitID = habitList[index].id;

    bloc.add(
      UpdateHabitStatus(
        habitID,
        direction == DismissDirection.startToEnd
            ? HabitStatus.completed
            : HabitStatus.skipped,
      ),
    );
  }

  void onSelectFilters(int index, HabitListFilters filter) {
    bloc.add(
      UpdateFilter(
        index,
        filter == HabitListFilters.repeate
            ? HabitListFilters.repeate
            : HabitListFilters.schedule,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitBloc, HabitState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: MainScreenAppBarWidget(
            title: 'Home',
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: AppSizes.paddingLg),
            child: Column(
              spacing: AppSizes.defaultBtwItems,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HomePageScheduleToggleWidget(
                //   currentIndex: _selectedHomePage,
                //   labels: habitRepeateFilters,
                //   onToggle:
                //       (index) =>
                //           onSelectFilters(index, HabitListFilters.repeate),
                // ),
                HomePageFilterToggleWidget(
                  currentIndex: state.selectedSchedule,
                  labels: habitScheduleFilters,
                  onPressed:
                      (index) =>
                          onSelectFilters(index, HabitListFilters.schedule),
                ),

                CurrentHabitListWidget(
                  habitList: state.todoHabit,
                  onDrag: (dir, idx) => onDrag(dir),
                  onDismissed:
                      (dir, idx) => onDismissed(dir, idx, state.todoHabit),
                  bgHabitContainer: state.bgColor,
                  alignmentHabitContainer: state.alignment,
                  iconHabitContainer: state.icon,
                  habitTitleContainer: state.title,
                ),

                if (state.skippedHabits.isNotEmpty) ...[
                  LabeledHabitListWidget(
                    habitList: state.skippedHabits,
                    label: 'Skipped',
                  ),
                ],

                if (state.completedHabit.isNotEmpty) ...[
                  LabeledHabitListWidget(
                    habitList: state.completedHabit,
                    label: 'Completed',
                  ),
                ],
              ],
            ),
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () => context.push(RouteNames.createNewHabit),
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
