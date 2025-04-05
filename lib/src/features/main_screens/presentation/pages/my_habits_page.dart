import 'package:flutter/material.dart';
import 'package:habitly/src/constants/sizes.dart';

class MyHabitPage extends StatefulWidget {
  const MyHabitPage({super.key});

  @override
  State<MyHabitPage> createState() => _MyHabitPageState();
}

class _MyHabitPageState extends State<MyHabitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 50.0,
        leading: Container(
          margin: EdgeInsets.only(left: AppSizes.paddingLg),
          child: Image.asset('assets/images/logo.png'),
        ),
        centerTitle: true,
        title: Text(
          'My Habits',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.history))],
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
