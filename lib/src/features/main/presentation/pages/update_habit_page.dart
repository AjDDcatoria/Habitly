import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habitly/src/common/footer_app_bar.dart';
import 'package:habitly/src/common/label_input.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/constants/strings/habit_constants.dart';
import 'package:habitly/src/constants/strings/icon_constants.dart';
import 'package:habitly/src/data/model/habit_model.dart';
import 'package:habitly/src/features/main/bloc/habit/habit_bloc.dart';
import 'package:habitly/src/features/main/presentation/widgets/color_picker_widget.dart';
import 'package:habitly/src/features/main/presentation/widgets/daily_picker_widget.dart';
import 'package:habitly/src/features/main/presentation/widgets/habit_weekly_picker_widget.dart';
import 'package:habitly/src/features/main/presentation/widgets/home_page_filter_toggle_widget.dart';
import 'package:habitly/src/themes/theme.dart';
import 'package:habitly/src/utils/color_util.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class UpdateHabitPage extends StatefulWidget {
  const UpdateHabitPage({super.key});

  @override
  State<UpdateHabitPage> createState() => _UpdateHabitPageState();
}

class _UpdateHabitPageState extends State<UpdateHabitPage> {
  final TextEditingController _habitTitle = TextEditingController();

  int? _selectedIcon;
  int? _selecteColor;
  int _selectedRepeatIndex = 0;
  bool isCheckAllDay = false;
  final Set _selectedDaysOfTheWeek = <String>{};
  int _selectedNumberOfDays = 0;
  bool isSetReminderOn = false;

  String? habitId;
  late final HabitBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<HabitBloc>();

    setState(() {
      _selecteColor = getIndexColor(bloc.state.selectedViewHabit!.bgColor);
      _selectedIcon = allIcons.indexOf(bloc.state.selectedViewHabit!.icon);
      _selectedRepeatIndex = bloc.state.selectedViewHabit!.repeate.index;
      _selectedNumberOfDays = bloc.state.selectedSchedule;
      _habitTitle.text = bloc.state.selectedViewHabit!.title;

      if (bloc.state.selectedViewHabit!.repeate.index == 1) {
        _selectedNumberOfDays = int.parse(
          bloc.state.selectedViewHabit!.repeateValues[0],
        );
      } else {
        for (String day in bloc.state.selectedViewHabit!.repeateValues) {
          _selectedDaysOfTheWeek.add(day);
        }

        isCheckAllDay = _selectedDaysOfTheWeek.length == 7;
      }
      isSetReminderOn = bloc.state.selectedViewHabit!.reminder;
    });
  }

  void selectIcon(int value) {
    setState(() {
      _selectedIcon = value;
    });
  }

  void onUpdateHabit() {
    bloc.add(
      OnUpdateHabit(
        Habit(
          id: bloc.state.selectedViewHabit!.id,
          title: _habitTitle.text,
          icon: allIcons[_selectedIcon!],
          bgColor: getColorString(_selecteColor!),
          status: HabitStatus.todo,
          schedule: HabitSchedule.values[_selectedNumberOfDays],
          repeate: HabitRepeate.values[_selectedRepeatIndex],
          repeateValues:
              _selectedRepeatIndex == 0
                  ? _selectedDaysOfTheWeek.toList()
                  : [_selectedNumberOfDays.toString()],
          reminder: isSetReminderOn,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonTheme = Theme.of(context).extension<SecondaryButtonTheme>()!;

    return BlocBuilder<HabitBloc, HabitState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Update Habit',
              style: TextStyle(fontSize: AppSizes.fontXl),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: null,
                icon: Icon(
                  Iconsax.trash_copy,
                  color: AppColors.error,
                  size: 30,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(AppSizes.paddingLg),
            child: SingleChildScrollView(
              child: Column(
                spacing: AppSizes.defaultBtwItems,
                children: <Widget>[
                  _label(
                    title: 'Task Name',
                    child: TextField(
                      controller: _habitTitle,
                      decoration: InputDecoration(hintText: 'Habit Name'),
                    ),
                  ),
                  _iconList(context, buttonTheme),
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
                            labels: habitRepeateList,
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
                          labels: habitdaysOfTheWeeksList,
                          onTap: (int index) {
                            setState(() {
                              if (!_selectedDaysOfTheWeek.contains(
                                habitdaysOfTheWeeksList[index].label,
                              )) {
                                _selectedDaysOfTheWeek.add(
                                  habitdaysOfTheWeeksList[index].label,
                                );
                              } else {
                                _selectedDaysOfTheWeek.remove(
                                  habitdaysOfTheWeeksList[index].label,
                                );
                              }
                            });
                          },
                        ),
                      ] else ...[
                        HabitWeeklyPickerWidget(
                          labels: habitnumberOfDaysList,
                          onTap: (int index) {
                            setState(() {
                              _selectedNumberOfDays = index;
                            });
                          },
                          selectedLabel: _selectedNumberOfDays,
                        ),
                      ],
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
            ),
          ),
          bottomNavigationBar: FooterAppBar(
            child: ElevatedButton(
              onPressed: () {
                onUpdateHabit();
                context.pop();
                context.pop();
              },
              child: Text('Save'),
            ),
          ),
        );
      },
    );
  }

  SizedBox _iconList(BuildContext context, SecondaryButtonTheme buttonTheme) {
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
                onPressed: () {
                  _showModalBottomSheetIcons(context, buttonTheme);
                },
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
              children: List.generate(allIcons.length, (int index) {
                return _iconButton(index, (value) {
                  selectIcon(value);
                }, context);
              }),
            ),
          ),
        ],
      ),
    );
  }

  Column _label({required String title, required Widget child}) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        title,
        style: TextStyle(
          fontSize: AppSizes.fontLg,
          fontWeight: FontWeight.w800,
        ),
      ),
      const SizedBox(height: AppSizes.defaultBtwItems),
      child,
    ],
  );

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
}
