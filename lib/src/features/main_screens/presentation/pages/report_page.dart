import 'package:flutter/material.dart';
import 'package:habitly/src/features/main_screens/presentation/widgets/main_screen_appbar_widget.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainScreenAppBarWidget(
        title: 'Report',
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: Center(
        child: Text(
          'Report Page',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
