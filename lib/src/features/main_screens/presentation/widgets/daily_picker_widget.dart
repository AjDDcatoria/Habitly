import 'package:flutter/material.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/features/main_screens/presentation/pages/create_new_habit_page.dart';

class DailyPickerWidget extends StatelessWidget {
  final bool isCheckAllDay;
  final Function(bool?)? onChanged;
  final List<DayTitles> labels;
  final Function(int index) onTap;
  final Set<dynamic> selectedLabels;

  const DailyPickerWidget({
    super.key,
    required this.isCheckAllDay,
    required this.onChanged,
    required this.labels,
    required this.onTap,
    required this.selectedLabels,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('On These Day'),
              Row(
                children: [
                  Text('All Day'),
                  Checkbox(value: isCheckAllDay, onChanged: onChanged),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 35.0,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 10.0);
              },
              itemCount: labels.length,
              itemBuilder: (BuildContext context, int index) {
                bool isSelected = selectedLabels.contains(labels[index].label);
                return GestureDetector(
                  onTap: () => onTap(index),
                  child: Container(
                    width: 48.0,
                    decoration: BoxDecoration(
                      color:
                          isSelected ? AppColors.primary : Colors.transparent,
                      border: Border.all(color: AppColors.lightBorder),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                      child: Text(
                        labels[index].title,
                        style: TextStyle(
                          color:
                              isSelected ? AppColors.light : AppColors.darkGrey,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
