import 'package:flutter/material.dart';
import 'package:habitly/src/features/main_screens/presentation/widgets/main_screen_appbar_widget.dart';

class MyHabitPage extends StatefulWidget {
  const MyHabitPage({super.key});

  @override
  State<MyHabitPage> createState() => _MyHabitPageState();
}

class _MyHabitPageState extends State<MyHabitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainScreenAppBarWidget(
        title: 'My Habits',
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: Center(
        child: Text(
          'My Habit Page',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
