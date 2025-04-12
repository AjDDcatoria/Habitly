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
import 'package:habitly/src/themes/theme.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

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
  int? _selectedIcon;

  List<DateTime> _selectedDates = [];

  final List<String> _doItAtList = ['Morning', 'Afternoon', 'Evening'];
  int _selectedDoItAt = 0;

  int? _selecteColor;

  bool isCheckAllDay = false;
  bool isSetReminderOn = false;

  void selectIcon(int value) {
    setState(() {
      _selectedIcon = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final buttonTheme = Theme.of(context).extension<SecondaryButtonTheme>()!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.close),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.paddingLg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppSizes.defaultBtwSections,
            children: <Widget>[
              Center(
                child: Text(
                  'Create new Habit',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
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
                          onPressed: () {
                            _showModalBottomSheetIcons(context, buttonTheme);
                          },
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
                        children: List.generate(allIcons.length, (int index) {
                          return _iconButton(index, (value) {
                            selectIcon(value);
                          }, context);
                        }),
                      ),
                    ),
                  ],
                ),
              ),

              ColorPicker(
                selected: _selecteColor,
                onTap: (value) {
                  setState(() {
                    _selecteColor = value;
                  });
                },
              ),

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
                      currentIndex: _selectedDoItAt,
                      horizontalPadding: 30.0,
                      verticalPadding: 10.0,
                      labels: _doItAtList,
                      onPressed: (index) {
                        setState(() {
                          _selectedDoItAt = index;
                        });
                      },
                    ),
                  ],
                ),
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
        ),
      ),
      bottomNavigationBar: FooterAppBar(
        child: ElevatedButton(onPressed: () {}, child: Text('Save')),
      ),
    );
  }

  Future<dynamic> _showModalBottomSheetIcons(
    BuildContext context,
    SecondaryButtonTheme buttonTheme,
  ) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      showDragHandle: true,
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              height: 700.0,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        'Choose Icon',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Divider(),
                      SizedBox(
                        height: 560.0,
                        child: SingleChildScrollView(
                          child: Wrap(
                            spacing: 16.0,
                            runSpacing: 16.0,
                            children: List.generate(allIcons.length, (
                              int index,
                            ) {
                              return _iconButton(index, (value) {
                                selectIcon(value);
                                setState(() {
                                  _selectedIcon = value;
                                });
                              }, context);
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),

                    child: Row(
                      spacing: 16.0,
                      children: <Widget>[
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: buttonTheme.secondary.style,
                            child: Text('Cancel'),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
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

  OutlinedButton _iconButton(
    int index,
    Function onChange,
    BuildContext context,
  ) {
    return OutlinedButton(
      onPressed: () {
        onChange(index);
      },
      style: OutlinedButton.styleFrom(
        backgroundColor:
            _selectedIcon == index ? AppColors.primary : Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Text(
        allIcons[index],
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
