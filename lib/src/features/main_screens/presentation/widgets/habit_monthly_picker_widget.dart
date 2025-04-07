import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:habitly/src/constants/colors.dart';

class HabitMonthlyPickerWidget extends StatelessWidget {
  final List<DateTime> selectedDates;
  final Function(List<DateTime>) onValueChange;

  const HabitMonthlyPickerWidget({
    super.key,
    required this.selectedDates,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightBorder),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              calendarType: CalendarDatePicker2Type.multi,
              disableMonthPicker: true,
              disableModePicker: true,
              hideScrollViewMonthWeekHeader: true,
              hideNextMonthIcon: true,
              hideLastMonthIcon: true,
              hideScrollViewTopHeader: true,
              hideMonthPickerDividers: true,
              hideScrollViewTopHeaderDivider: true,
              hideYearPickerDividers: true,
              selectedDayHighlightColor: AppColors.primary,
            ),
            value: selectedDates,
            onValueChanged: onValueChange,
          ),
        ],
      ),
    );
  }
}
