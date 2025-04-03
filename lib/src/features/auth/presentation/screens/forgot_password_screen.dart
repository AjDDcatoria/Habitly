import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitly/src/components/label_input.dart';
import 'package:habitly/src/components/wide_container.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/features/auth/presentation/widgets/footer_app_bar.dart';
import 'package:habitly/src/routes/routes_names.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
              'Forgot Your Password?🔑',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              'Enter the email associated with your Habitly account to receive a password reset code.',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            LabelInput(
              label: "Your registered Email",
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: "Enter your email",
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FooterAppBar(
        child: WideContainer(
          child: ElevatedButton(
            onPressed: () => context.push(RouteNames.otpCode),
            child: Text('Send OTP Code'),
          ),
        ),
      ),
    );
  }
}
