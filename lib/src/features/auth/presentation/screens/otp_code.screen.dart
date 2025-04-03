import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:habitly/src/routes/routes_names.dart';

class OtpCodeScreen extends StatefulWidget {
  const OtpCodeScreen({super.key});

  @override
  State<OtpCodeScreen> createState() => _OtpCodeScreenState();
}

class _OtpCodeScreenState extends State<OtpCodeScreen> {
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
              'Enter OTP Code🔐',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              'Check your email inbox for a password reset code. Enter the code below to continue.',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            OtpTextField(
              numberOfFields: 4,
              borderColor: AppColors.darkBorder,
              showFieldAsBox: true,
              fieldWidth: 73.0,
              margin: EdgeInsets.symmetric(horizontal: 10),
              textStyle: Theme.of(context).textTheme.headlineMedium,
              autoFocus: true,
              borderRadius: BorderRadius.circular(8.0),
              enabledBorderColor: Colors.transparent,
              filled: true,
              fillColor: AppColors.lightGrey,
              onSubmit: (String verificationCode) {
                context.go(RouteNames.newPassword);
              },
            ),
            Center(
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: 'You can resent the code in ',
                      style: Theme.of(context).textTheme.titleSmall,
                      children: [
                        TextSpan(
                          text: '56',
                          style: TextStyle(color: AppColors.primary),
                        ),
                        TextSpan(text: ' seconds'),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Resend code',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16.0,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
