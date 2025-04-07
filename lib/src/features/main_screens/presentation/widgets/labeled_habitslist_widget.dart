import 'package:flutter/material.dart';
import 'package:habitly/src/components/habit_button.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/model/habit_model.dart';

class LabeledHabitListWidget extends StatefulWidget {
  final List<Habit> habitList;
  final String label;

  const LabeledHabitListWidget({
    super.key,
    required this.habitList,
    required this.label,
  });

  @override
  State<LabeledHabitListWidget> createState() => _LabeledHabitListWidgetState();
}

class _LabeledHabitListWidgetState extends State<LabeledHabitListWidget> {
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
                widget.label,
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
          itemCount: widget.habitList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder:
              (context, index) => SizedBox(height: AppSizes.defaultBtwItems),
          itemBuilder: (context, index) {
            final habit = widget.habitList[index];
            return HabitButton(
              icon: habit.icon,
              title: habit.title,
              color: habit.bgColor,
              labeled: widget.label,
            );
          },
        ),
      ],
    );
  }
}
