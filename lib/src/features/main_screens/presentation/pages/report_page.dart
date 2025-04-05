import 'package:flutter/material.dart';
import 'package:habitly/src/constants/sizes.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
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
        title: Text('Report', style: Theme.of(context).textTheme.headlineSmall),
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
