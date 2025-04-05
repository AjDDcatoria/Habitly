import 'package:flutter/material.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/features/main_screens/presentation/widgets/habit_button.dart';
import 'package:habitly/src/model/habit_model.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Habit> habitList = [
    Habit(
      id: '1',
      title: 'Set Small Goals',
      icon: '🎯',
      bgColor: 'creamOrange',
    ),
    Habit(id: '2', title: 'Work', icon: '🏆', bgColor: 'periwinkle'),
    Habit(id: '3', title: 'Meditation', icon: '😇', bgColor: 'mintGreen'),
    Habit(id: '4', title: 'Basketball', icon: '🏀', bgColor: 'peach'),
  ];

  Color? bgHabitContainer;
  Alignment? alignmentHabitContainer;
  IconData? iconHabitContainer;
  String? habitTitleContainer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leadingWidth: 50.0,
        leading: Container(
          margin: EdgeInsets.only(left: AppSizes.paddingLg),
          child: Image.asset('assets/images/logo.png'),
        ),
        centerTitle: true,
        title: Text('Home', style: Theme.of(context).textTheme.headlineSmall),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: AppSizes.paddingLg),
        child: Column(
          spacing: AppSizes.defaultBtwItems,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingLg),
              child: ToggleSwitch(
                initialLabelIndex: 0,
                minHeight: 55.0,
                fontSize: 15,
                minWidth: double.infinity,
                inactiveBgColor: AppColors.lightGrey,
                activeFgColor: Colors.white,
                totalSwitches: 3,
                customTextStyles: [TextStyle(fontWeight: FontWeight.w600)],
                labels: ['Today', 'Weekly', 'Overall'],
                onToggle: (index) {},
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingLg),
              child: Row(
                spacing: AppSizes.defaultBtwItems,
                children: <Widget>[
                  ElevatedButton(onPressed: () {}, child: Text('All')),
                  OutlinedButton(onPressed: () {}, child: Text('Morning')),
                  OutlinedButton(onPressed: () {}, child: Text('Afternoon')),
                  OutlinedButton(onPressed: () {}, child: Text('Evening')),
                ],
              ),
            ),
            ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingLg),
              itemCount: habitList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder:
                  (context, index) =>
                      SizedBox(height: AppSizes.defaultBtwItems),
              itemBuilder: (context, index) {
                final habit = habitList[index];
                return Dismissible(
                  key: Key(habit.id),
                  onUpdate: (dragDetails) {
                    setState(() {
                      if (dragDetails.direction ==
                          DismissDirection.startToEnd) {
                        alignmentHabitContainer = Alignment.centerLeft;
                        bgHabitContainer = AppColors.success;
                        iconHabitContainer = Icons.check;
                        habitTitleContainer = '';
                      } else if (dragDetails.direction ==
                          DismissDirection.endToStart) {
                        bgHabitContainer = AppColors.error;
                        alignmentHabitContainer = Alignment.centerRight;
                        iconHabitContainer = Iconsax.arrow_right_1_copy;
                        habitTitleContainer = 'Skip';
                      }
                    });
                  },
                  onDismissed: (direction) {
                    setState(() {
                      habitList.removeAt(index);
                    });
                  },
                  background: Container(
                    alignment: alignmentHabitContainer,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.paddingLg,
                    ),
                    decoration: BoxDecoration(
                      color: bgHabitContainer,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextButton.icon(
                      onPressed: () {},
                      iconAlignment: IconAlignment.end,
                      label: Text(
                        habitTitleContainer ?? '',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                      icon: Icon(
                        iconHabitContainer,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                  child: HabitButton(
                    icon: habit.icon,
                    title: habit.title,
                    color: habit.bgColor,
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.paddingLg),
              child: Text('Completed'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
