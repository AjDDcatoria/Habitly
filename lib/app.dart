import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitly/src/features/main_screens/bloc/habit/habit_bloc.dart';
import 'package:habitly/src/routes/app_router.dart';
import 'package:habitly/src/themes/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HabitBloc())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme,
        routerConfig: appRouter,
      ),
    );
  }
}
