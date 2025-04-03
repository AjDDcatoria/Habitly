import 'package:flutter/material.dart';
import 'package:habitly/src/components/label_input.dart';
import 'package:habitly/src/components/wide_container.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/features/auth/presentation/widgets/footer_app_bar.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSizes.defaultBtwItems,
          children: <Widget>[
            Text(
              'Secure Your Account🔒',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              "Create a new password for your Habitly account. Make sure it's secure and easy to remember.",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            LabelInput(
              label: "New Password",
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  hintText: "Enter password",
                ),
              ),
            ),
            LabelInput(
              label: "Confirm New Password",
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  hintText: "Confirm password",
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FooterAppBar(
        child: WideContainer(
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Save New Password'),
          ),
        ),
      ),
    );
  }
}
