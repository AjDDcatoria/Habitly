import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/features/auth/presentation/widgets/footer_app_bar.dart';
import 'package:habitly/src/features/main_screens/presentation/widgets/current_habitlist_widget.dart';
import 'package:habitly/src/features/main_screens/presentation/widgets/home_page_filter_toggle_widget.dart';
import 'package:habitly/src/features/main_screens/presentation/widgets/home_page_schedule_toggle_widget.dart';
import 'package:habitly/src/features/main_screens/presentation/widgets/labeled_habitslist_widget.dart';
import 'package:habitly/src/features/main_screens/presentation/widgets/main_screen_appbar_widget.dart';
import 'package:habitly/src/model/habit_model.dart';
import 'package:habitly/src/routes/routes_names.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Current habit list
  final List<Habit> currentHabitList = [
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

  // Completed habit list
  final List<Habit> completedHabitList = [];
  // Skip habit list
  final List<Habit> skipedHabitList = [];

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

  void onDrag(dragDetails, index) {
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
      Habit habit = currentHabitList.removeAt(index);
      if (direction == DismissDirection.startToEnd) {
        completedHabitList.insert(0, habit);
      } else if (direction == DismissDirection.endToStart) {
        skipedHabitList.insert(0, habit);
      }
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
            CurrentHabitListWidget(
              habitList: currentHabitList,
              onDrag: onDrag,
              onDismissed: onDismissed,
              bgHabitContainer: bgHabitContainer,
              alignmentHabitContainer: alignmentHabitContainer,
              iconHabitContainer: iconHabitContainer,
              habitTitleContainer: habitTitleContainer,
            ),
            if (skipedHabitList.isNotEmpty) ...[
              LabeledHabitListWidget(
                habitList: skipedHabitList,
                label: 'Skipped',
              ),
            ],

            if (completedHabitList.isNotEmpty) ...[
              LabeledHabitListWidget(
                habitList: completedHabitList,
                label: 'Completed',
              ),
            ],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(RouteNames.createNewHabit),
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
