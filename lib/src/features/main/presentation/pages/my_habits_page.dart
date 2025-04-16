import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitly/src/common/habit_button.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/features/main/bloc/habit/habit_bloc.dart';
import 'package:habitly/src/features/main/presentation/widgets/main_screen_appbar_widget.dart';

class MyHabitPage extends StatefulWidget {
  const MyHabitPage({super.key});

  @override
  State<MyHabitPage> createState() => _MyHabitPageState();
}

class _MyHabitPageState extends State<MyHabitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainScreenAppBarWidget(
        title: 'My Habits',
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: BlocBuilder<HabitBloc, HabitState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingLg),
              itemCount: state.habits.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder:
                  (context, index) =>
                      SizedBox(height: AppSizes.defaultBtwItems),
              itemBuilder: (context, index) {
                final habit = state.habits[index];
                return HabitButton(
                  icon: habit.icon,
                  title: habit.title,
                  color: habit.bgColor,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
