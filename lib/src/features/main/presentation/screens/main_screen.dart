import 'package:flutter/material.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/features/main/presentation/pages/home_page.dart';
import 'package:habitly/src/features/main/presentation/pages/mood_state.dart';
import 'package:habitly/src/features/main/presentation/pages/my_habits_page.dart';
import 'package:habitly/src/features/main/presentation/pages/report_page.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = const [
    HomePage(),
    MoodStatPage(),
    ReportPage(),
    MyHabitPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        fixedColor: AppColors.primary,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home_2),
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_emotions_outlined),
            label: 'Mood State',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.activity_copy),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.category_copy),
            label: 'My Habits',
          ),
        ],
      ),
    );
  }
}
