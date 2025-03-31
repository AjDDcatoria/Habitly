import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/routes/routes_names.dart';

class WalkThrough extends StatelessWidget {
  const WalkThrough({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Walk through',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.light,
        height: 100.0,
        padding: EdgeInsets.all(0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingLg),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey[300]!, // Border color
                width: 1.0, // Border thickness
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppSizes.defaultBtwItems,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => context.go(RouteNames.welcome),
                  child: Text("Let's Get Started"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
