import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitly/src/common/habit_button.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/data/model/habit_model.dart';
import 'package:habitly/src/routes/routes_names.dart';

class CurrentHabitListWidget extends StatefulWidget {
  final List<Habit> habitList;
  final Function onDrag;
  final Function onDismissed;
  final Color? bgHabitContainer;
  final Alignment? alignmentHabitContainer;
  final IconData? iconHabitContainer;
  final String? habitTitleContainer;

  const CurrentHabitListWidget({
    super.key,
    required this.habitList,
    required this.onDrag,
    required this.onDismissed,
    required this.bgHabitContainer,
    required this.alignmentHabitContainer,
    required this.iconHabitContainer,
    required this.habitTitleContainer,
  });

  @override
  State<CurrentHabitListWidget> createState() => CurrentHabitListWidgetState();
}

class CurrentHabitListWidgetState extends State<CurrentHabitListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingLg),
      itemCount: widget.habitList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder:
          (context, index) => SizedBox(height: AppSizes.defaultBtwItems),
      itemBuilder: (context, index) {
        final habit = widget.habitList[index];
        return Dismissible(
          key: Key(habit.id),
          onUpdate: (dragDetails) => widget.onDrag(dragDetails, index),
          onDismissed: (direction) => widget.onDismissed(direction, index),
          background: Container(
            alignment: widget.alignmentHabitContainer,
            padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingLg),
            decoration: BoxDecoration(
              color: widget.bgHabitContainer,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TextButton.icon(
              onPressed: () {},
              iconAlignment: IconAlignment.end,
              label: Text(
                widget.habitTitleContainer ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
              icon: Icon(
                widget.iconHabitContainer,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ),
          child: HabitButton(
            onPressed: () {
              context.push(
                Uri(
                  path: RouteNames.viewHabit,
                  queryParameters: {'id': habit.id},
                ).toString(),
              );
            },
            icon: habit.icon,
            title: habit.title,
            color: habit.bgColor,
          ),
        );
      },
    );
  }
}
