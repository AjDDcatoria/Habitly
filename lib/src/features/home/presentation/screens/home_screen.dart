import 'package:flutter/material.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/routes/routes_names.dart';
import 'package:go_router/go_router.dart';
import 'package:habitly/src/themes/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonTheme = Theme.of(context).extension<SecondaryButtonTheme>()!;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSizes.defaultBtwItems,
          children: [
            Text('Home Screen'),
            SizedBox(height: AppSizes.defaultBtwSections),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                hintText: 'Enter your email',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline_rounded),
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
                hintText: 'Enter your Password',
              ),
            ),
            ElevatedButton(
              onPressed: () => context.go(RouteNames.signin),
              child: Text('Go to SignIn'),
            ),
            ElevatedButton(
              style: buttonTheme.secondary.style,
              onPressed: () {},
              child: Text('Secondary'),
            ),
            OutlinedButton(onPressed: () {}, child: Text('OutlinedButton')),
          ],
        ),
      ),
    );
  }
}
