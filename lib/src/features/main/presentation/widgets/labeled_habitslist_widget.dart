import 'package:flutter/material.dart';
import 'package:habitly/src/common/habit_button.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/data/model/habit_model.dart';

class LabeledHabitListWidget extends StatelessWidget {
  final List<Habit> habitList;
  final String label;

  const LabeledHabitListWidget({
    super.key,
    required this.habitList,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSizes.paddingLg),
          child: Row(
            spacing: AppSizes.defaultBtwItems,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[500],
                ),
              ),
              Expanded(child: Divider(color: AppColors.lightBorder)),
            ],
          ),
        ),
        ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingLg),
          itemCount: habitList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder:
              (context, index) => SizedBox(height: AppSizes.defaultBtwItems),
          itemBuilder: (context, index) {
            final habit = habitList[index];
            return HabitButton(
              icon: habit.icon,
              title: habit.title,
              color: habit.bgColor,
              labeled: label,
            );
          },
        ),
      ],
    );
  }
}
