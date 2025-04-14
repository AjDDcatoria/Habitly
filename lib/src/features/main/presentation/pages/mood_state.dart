import 'package:flutter/material.dart';
import 'package:habitly/src/features/main/presentation/widgets/main_screen_appbar_widget.dart';

class MoodStatPage extends StatefulWidget {
  const MoodStatPage({super.key});

  @override
  State<MoodStatPage> createState() => _MoodStatPageState();
}

class _MoodStatPageState extends State<MoodStatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainScreenAppBarWidget(
        title: 'Mood State',
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.history))],
      ),
      body: Center(
        child: Text(
          'Mood State Page',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
