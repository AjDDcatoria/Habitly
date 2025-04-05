import 'package:flutter/material.dart';
import 'package:habitly/src/constants/sizes.dart';

class MoodStatPage extends StatefulWidget {
  const MoodStatPage({super.key});

  @override
  State<MoodStatPage> createState() => _MoodStatPageState();
}

class _MoodStatPageState extends State<MoodStatPage> {
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
          'Mood State',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
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
