import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitly/src/components/label_input.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/constants/strings/icon_constants.dart';
import 'package:habitly/src/features/auth/presentation/widgets/footer_app_bar.dart';
import 'package:habitly/src/features/main_screens/presentation/widgets/home_page_filter_toggle_widget.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

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
              _iconList(context),
              _colorsGrid(),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      spacing: AppSizes.defaultBtwItems,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Repeat'),
                        HomePageFilterToggleWidget(
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
                      ],
                    ),
                  ),
                  if (_selectedRepeatIndex == 0) ...[
                    SizedBox(
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
                                  Checkbox(
                                    value: isCheckAllDay,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        // temporary
                                        Set dayList = {
                                          'sunday',
                                          'monday',
                                          'tuesday',
                                          'wedsday',
                                          'thursday',
                                          'friday',
                                          'saturday',
                                        };
                                        for (String day in dayList) {
                                          _selectedDaysOfTheWeek.add(day);
                                        }
                                        isCheckAllDay = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 35.0,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (
                                BuildContext context,
                                int index,
                              ) {
                                return SizedBox(width: 10.0);
                              },
                              itemCount: _daysOfTheWeek.length,
                              itemBuilder: (BuildContext context, int index) {
                                bool isSelected = _selectedDaysOfTheWeek
                                    .contains(_daysOfTheWeek[index].label);
                                String label = _daysOfTheWeek[index].label;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (isSelected) {
                                        _selectedDaysOfTheWeek.remove(label);
                                      } else {
                                        _selectedDaysOfTheWeek.add(label);
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 48.0,
                                    decoration: BoxDecoration(
                                      color:
                                          isSelected
                                              ? AppColors.primary
                                              : Colors.transparent,
                                      border: Border.all(
                                        color: AppColors.lightBorder,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        _daysOfTheWeek[index].title,
                                        style: TextStyle(
                                          color:
                                              isSelected
                                                  ? AppColors.light
                                                  : AppColors.darkGrey,
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
                    ),
                  ] else if (_selectedRepeatIndex == 1) ...[
                    Container(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${_numberOfDays[_selectedNumberOfDays]} days for week',
                          ),
                          SizedBox(
                            height: 60.0,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (
                                BuildContext context,
                                int index,
                              ) {
                                return SizedBox(width: 10.0);
                              },
                              itemCount: _numberOfDays.length,
                              itemBuilder: (BuildContext context, int index) {
                                String daynumber = _numberOfDays[index];
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedNumberOfDays = index;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(17),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.lightBorder,
                                      ),
                                      shape: BoxShape.circle,
                                      color:
                                          _selectedNumberOfDays == index
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
                                              _selectedNumberOfDays == index
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
                        ],
                      ),
                    ),
                  ] else ...[
                    SizedBox(height: 15.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.lightBorder),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Every mont on'),
                          Divider(),
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
                            ),
                            value: _selectedDates,
                            onValueChanged: (List<DateTime> dates) {
                              setState(() {
                                _selectedDates = dates;
                              });
                            },
                          ),
                        ],
                      ),
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

  Column _colorsGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSizes.defaultBtwItems,
      children: [
        Text('Color'),
        SizedBox(
          height: 240,
          child: GridView.count(
            crossAxisCount: 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            physics: NeverScrollableScrollPhysics(),
            children:
                colorList.map((color) {
                  return Container(
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                    margin: EdgeInsets.all(4),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }

  SizedBox _iconList(BuildContext context) {
    return SizedBox(
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
                label: Text('View all', style: TextStyle(fontSize: 16.0)),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 12.0,
              children:
                  allIcons
                      .map((buttonIcon) => _iconButton(buttonIcon, context))
                      .toList(),
            ),
          ),
        ],
      ),
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
