import 'package:flutter/material.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/features/main_screens/presentation/widgets/current_habit_widget.dart';
import 'package:habitly/src/features/main_screens/presentation/widgets/home_page_filter_toggle_widget.dart';
import 'package:habitly/src/features/main_screens/presentation/widgets/home_page_schedule_toggle_widget.dart';
import 'package:habitly/src/features/main_screens/presentation/widgets/main_screen_appbar_widget.dart';
import 'package:habitly/src/model/habit_model.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

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

  // Home page toggle list
  final List<String> homePageToggle = ['Today', 'Weekly', 'Overall'];
  int currentHomePage = 0;
  final List<String> homePageFilter = [
    'All',
    'Morning',
    'Afternoon',
    'Evening',
  ];
  int currentHomePageFilter = 0;

  void onDrag(dragDetails) {
    setState(() {
      if (dragDetails.direction == DismissDirection.startToEnd) {
        alignmentHabitContainer = Alignment.centerLeft;
        bgHabitContainer = AppColors.success;
        iconHabitContainer = Icons.check;
        habitTitleContainer = '';
      } else if (dragDetails.direction == DismissDirection.endToStart) {
        bgHabitContainer = AppColors.error;
        alignmentHabitContainer = Alignment.centerRight;
        iconHabitContainer = Iconsax.arrow_right_1_copy;
        habitTitleContainer = 'Skip';
      }
    });
  }

  void onDismissed(direction, index) {
    setState(() {
      habitList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: MainScreenAppBarWidget(
        title: 'Home',
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: AppSizes.paddingLg),
        child: Column(
          spacing: AppSizes.defaultBtwItems,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomePageScheduleToggleWidget(
              currentIndex: currentHomePage,
              labels: homePageToggle,
              onToggle: (index) {
                setState(() {
                  currentHomePage = index;
                });
              },
            ),
            HomePageFilterToggleWidget(
              currentIndex: currentHomePageFilter,
              labels: homePageFilter,
              onPressed: (index) {
                setState(() {
                  currentHomePageFilter = index;
                });
              },
            ),
            CurrentHabitWidget(
              habitList: habitList,
              onDrag: onDrag,
              onDismissed: onDismissed,
              bgHabitContainer: bgHabitContainer,
              alignmentHabitContainer: alignmentHabitContainer,
              iconHabitContainer: iconHabitContainer,
              habitTitleContainer: habitTitleContainer,
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
