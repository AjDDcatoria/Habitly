import 'package:flutter/material.dart';
import 'package:habitly/src/features/main_screens/presentation/widgets/main_screen_appbar_widget.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainScreenAppBarWidget(
        title: 'Account',
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: Center(
        child: Text(
          'Account Page',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
