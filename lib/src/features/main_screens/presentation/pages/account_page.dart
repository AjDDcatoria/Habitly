import 'package:flutter/material.dart';
import 'package:habitly/src/constants/sizes.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
          'Account',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.history))],
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
