import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitly/src/components/label_input.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/constants/strings/icon_constants.dart';
import 'package:habitly/src/features/auth/presentation/widgets/footer_app_bar.dart';
import 'package:habitly/src/features/main_screens/presentation/widgets/color_picker_widget.dart';
import 'package:habitly/src/features/main_screens/presentation/widgets/daily_picker_widget.dart';
import 'package:habitly/src/features/main_screens/presentation/widgets/habit_monthly_picker_widget.dart';
import 'package:habitly/src/features/main_screens/presentation/widgets/habit_weekly_picker_widget.dart';
import 'package:habitly/src/features/main_screens/presentation/widgets/home_page_filter_toggle_widget.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DayTitles {
  String title;
  String label;
  DayTitles({required this.title, required this.label});
}

class CreateNewHabitPage extends StatefulWidget {
  const CreateNewHabitPage({super.key});

  @override
  State<CreateNewHabitPage> createState() => _CreateNewHabitPageState();
}

class _CreateNewHabitPageState extends State<CreateNewHabitPage> {
  final List<String> _repeatList = ['Daily', 'Weekly', 'Monthly'];
  int _selectedRepeatIndex = 0;
  final List<DayTitles> _daysOfTheWeek = [
    DayTitles(title: 'S', label: 'sunday'),
    DayTitles(title: 'M', label: 'monday'),
    DayTitles(title: 'T', label: 'tuesday'),
    DayTitles(title: 'W', label: 'wedsday'),
    DayTitles(title: 'T', label: 'thursday'),
    DayTitles(title: 'F', label: 'friday'),
    DayTitles(title: 'S', label: 'saturday'),
  ];
  final Set _selectedDaysOfTheWeek = <String>{};
  Set dayList = {
    'sunday',
    'monday',
    'tuesday',
    'wedsday',
    'thursday',
    'friday',
    'saturday',
  };

  final List<String> _numberOfDays = ['1', '2', '3', '4', '5', '6', '7'];
  int _selectedNumberOfDays = 0;

  List<DateTime> _selectedDates = [];

  bool isCheckAllDay = false;

  bool isHabitEndOn = false;
  bool isSetReminderOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.close),
        ),
        title: Text('Create New Habit'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.paddingLg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppSizes.defaultBtwSections,
            children: <Widget>[
              ToggleSwitch(
                initialLabelIndex: 0,
                minHeight: 55.0,
                fontSize: 15,
                minWidth: double.infinity,
                inactiveBgColor: AppColors.lightGrey,
                activeFgColor: Colors.white,
                totalSwitches: 2,
                customTextStyles: [TextStyle(fontWeight: FontWeight.w600)],
                labels: ['Regular Habit', 'One-Time Task'],
                onToggle: (index) {},
              ),

              LabelInput(
                label: 'Habit Name',
                child: TextField(
                  decoration: InputDecoration(hintText: 'Habit Name'),
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Icon', style: TextStyle(fontSize: 16.0)),
                        TextButton.icon(
                          onPressed: () {},
                          iconAlignment: IconAlignment.end,
                          icon: Icon(Iconsax.arrow_right_1_copy, size: 22.0),
                          label: Text(
                            'View all',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 12.0,
                        children:
                            allIcons
                                .map(
                                  (buttonIcon) =>
                                      _iconButton(buttonIcon, context),
                                )
                                .toList(),
                      ),
                    ),
                  ],
                ),
              ),

              ColorPicker(),

              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: LabelInput(
                      label: "Repeate",
                      child: HomePageFilterToggleWidget(
                        currentIndex: _selectedRepeatIndex,
                        horizontalPadding: 30.0,
                        verticalPadding: 10.0,
                        labels: _repeatList,
                        onPressed: (index) {
                          setState(() {
                            _selectedRepeatIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  if (_selectedRepeatIndex == 0) ...[
                    DailyPickerWidget(
                      isCheckAllDay: isCheckAllDay,
                      onChanged: (bool? value) {
                        setState(() {
                          for (String day in dayList) {
                            _selectedDaysOfTheWeek.add(day);
                          }
                          isCheckAllDay = value!;
                        });
                      },
                      selectedLabels: _selectedDaysOfTheWeek,
                      labels: _daysOfTheWeek,
                      onTap: (int index) {
                        setState(() {
                          if (!_selectedDaysOfTheWeek.contains(
                            _daysOfTheWeek[index].label,
                          )) {
                            _selectedDaysOfTheWeek.add(
                              _daysOfTheWeek[index].label,
                            );
                          } else {
                            _selectedDaysOfTheWeek.remove(
                              _daysOfTheWeek[index].label,
                            );
                          }
                        });
                      },
                    ),
                  ] else if (_selectedRepeatIndex == 1) ...[
                    HabitWeeklyPickerWidget(
                      labels: _numberOfDays,
                      onTap: (int index) {
                        setState(() {
                          _selectedNumberOfDays = index;
                        });
                      },
                      selectedLabel: _selectedNumberOfDays,
                    ),
                  ] else ...[
                    SizedBox(height: 15.0),
                    HabitMonthlyPickerWidget(
                      selectedDates: _selectedDates,
                      onValueChange: (List<DateTime> dates) {
                        setState(() {
                          _selectedDates = [...dates];
                        });
                      },
                    ),
                  ],
                ],
              ),

              SizedBox(
                width: double.infinity,
                child: Column(
                  spacing: AppSizes.defaultBtwItems,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Dot it at:'),
                    HomePageFilterToggleWidget(
                      currentIndex: 0,
                      horizontalPadding: 30.0,
                      verticalPadding: 10.0,
                      labels: ['Morning', 'Afternoon', 'Evening'],
                      onPressed: (index) {},
                    ),
                  ],
                ),
              ),

              Column(
                spacing: AppSizes.defaultBtwItems,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('End Habit on'),
                      Transform.scale(
                        scale: 0.7,
                        child: _switch(isHabitEndOn, (value) {
                          setState(() {
                            isHabitEndOn = value;
                          });
                        }),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Set Reminder'),
                      Transform.scale(
                        scale: 0.7,
                        child: _switch(isSetReminderOn, (value) {
                          setState(() {
                            isSetReminderOn = value;
                          });
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FooterAppBar(
        child: ElevatedButton(onPressed: () {}, child: Text('Save')),
      ),
    );
  }

  Switch _switch(bool switchValue, ValueChanged onChange) {
    return Switch(
      value: switchValue,
      inactiveTrackColor: Colors.grey[400],
      inactiveThumbColor: Colors.white,
      activeColor: const Color.fromARGB(255, 56, 6, 236),
      thumbIcon: MaterialStateProperty.resolveWith<Icon>((
        final Set<MaterialState> states,
      ) {
        return const Icon(Icons.circle, size: 25, color: Colors.white);
      }),
      trackOutlineColor: MaterialStateProperty.resolveWith((
        final Set<MaterialState> states,
      ) {
        return Colors.transparent;
      }),
      onChanged: onChange,
    );
  }

  OutlinedButton _iconButton(String buttonIcon, BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Text(buttonIcon, style: Theme.of(context).textTheme.headlineLarge),
    );
  }
}
