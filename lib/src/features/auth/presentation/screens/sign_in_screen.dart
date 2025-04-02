import 'package:flutter/material.dart';
import 'package:habitly/src/common_widgets/social_account_buttons.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/components/label_input.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isRememberMe = false;
  Color getColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColors.primary;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.paddingLg),
            child: Column(
              spacing: AppSizes.defaultBtwItems,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Welcome Back!👋',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "Sign in to access your personalized habit\ntracking experience.",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                LabelInput(
                  label: 'Email',
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: 'Email',
                    ),
                  ),
                ),
                LabelInput(
                  label: 'Password',
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_open_sharp),
                      hintText: 'Password',
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: <Widget>[
                        Checkbox(
                          checkColor: AppColors.primary,
                          value: isRememberMe,
                          fillColor: WidgetStateProperty.resolveWith(getColor),
                          onChanged: (bool? value) {
                            setState(() {
                              isRememberMe = value!;
                            });
                          },
                        ),
                        Text(
                          'Remember me',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.fontMd,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: AppSizes.defaultBtwItems,
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        height: 50.0,
                        color: AppColors.lightBorder,
                      ),
                    ),
                    Text('or', style: Theme.of(context).textTheme.titleSmall),
                    Expanded(
                      child: Divider(
                        height: 50.0,
                        color: AppColors.lightBorder,
                      ),
                    ),
                  ],
                ),
                SocialAccountButtons(),
              ],
            ),
          ),
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
                child: ElevatedButton(onPressed: () {}, child: Text("Sign in")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
