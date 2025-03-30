import 'package:flutter/material.dart';
import 'package:habitly/src/routes/app_router.dart';
import 'package:habitly/src/themes/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}
