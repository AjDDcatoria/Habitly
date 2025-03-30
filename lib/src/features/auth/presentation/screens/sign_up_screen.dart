import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/routes/routes_names.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up'), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppSizes.defaultBtwItems,
            children: [
              Text('Home Screen'),
              SizedBox(height: AppSizes.defaultBtwSections),
              ElevatedButton(
                onPressed: () => context.go(RouteNames.signin),
                child: Text('Go to SignIn'),
              ),
              OutlinedButton(onPressed: () {}, child: Text('Go to SignUp')),
            ],
          ),
        ),
      ),
    );
  }
}
