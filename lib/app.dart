import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitly/src/data/repositories/habit_repo.dart';
import 'package:habitly/src/features/main/bloc/habit/habit_bloc.dart';
import 'package:habitly/src/routes/app_router.dart';
import 'package:habitly/src/themes/theme.dart';

class App extends StatelessWidget {
  final HabitRepository habitRepository;
  const App({super.key, required this.habitRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HabitBloc(habitRepository)),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme,
        routerConfig: appRouter,
      ),
    );
  }
}
