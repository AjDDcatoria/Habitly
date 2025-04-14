import 'package:flutter/material.dart';
import 'package:habitly/src/common/label_input.dart';
import 'package:habitly/src/constants/colors.dart';

class HabitWeeklyPickerWidget extends StatelessWidget {
  final List<String> labels;
  final int selectedLabel;
  final Function(int index) onTap;

  const HabitWeeklyPickerWidget({
    super.key,
    required this.labels,
    required this.onTap,
    required this.selectedLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      child: LabelInput(
        label: '${labels[selectedLabel]} days for week',
        child: SizedBox(
          height: 60.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 10.0);
            },
            itemCount: labels.length,
            itemBuilder: (BuildContext context, int index) {
              String daynumber = labels[index];
              return GestureDetector(
                onTap: () => onTap(index),
                child: Container(
                  padding: EdgeInsets.all(17),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightBorder),
                    shape: BoxShape.circle,
                    color:
                        selectedLabel == index
                            ? AppColors.primary
                            : Colors.transparent,
                  ),
                  child: Center(
                    child: Text(
                      daynumber,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                        color:
                            selectedLabel == index
                                ? AppColors.light
                                : AppColors.darkGrey,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
