import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/features/main/bloc/habit/habit_bloc.dart';
import 'package:habitly/src/routes/routes_names.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ViewHabitPage extends StatefulWidget {
  const ViewHabitPage({super.key});

  @override
  State<ViewHabitPage> createState() => _ViewHabitPageState();
}

class _ViewHabitPageState extends State<ViewHabitPage> {
  String? habitId;
  late final HabitBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final parameters = GoRouterState.of(context).uri.queryParameters;
    habitId = parameters['id'];

    bloc = context.read<HabitBloc>();
    bloc.add(GetHabitById(habitId!));
  }

  void onDeleteHabit(String id) {
    bloc.add(OnDeleteHabit(id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitBloc, HabitState>(
      builder: (context, state) {
        final habit = state.selectedViewHabit;

        if (habit == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Habit',
              style: TextStyle(fontSize: AppSizes.fontXl),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  context.push(
                    Uri(
                      path: RouteNames.updateHabit,
                      queryParameters: {'id': habit.id},
                    ).toString(),
                  );
                },
                icon: Icon(Iconsax.edit_2_copy, color: AppColors.darkBorder),
              ),
              IconButton(
                onPressed: () {
                  onDeleteHabit(habit.id);
                  context.pop();
                },
                icon: Icon(Iconsax.trash_copy, color: AppColors.error),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(AppSizes.paddingLg),
            child: Column(
              spacing: AppSizes.defaultBtwItems,
              children: [
                _container(
                  child: Row(
                    spacing: AppSizes.defaultBtwItems,
                    children: [
                      Text(
                        state.selectedViewHabit?.icon ?? ' test',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.selectedViewHabit?.title ?? ' unknown',
                            style: TextStyle(
                              fontSize: AppSizes.fontXl,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                            ),
                          ),
                          Text(
                            state.selectedViewHabit!.repeate.name,
                            style: TextStyle(
                              fontSize: AppSizes.fontMd,
                              color: AppColors.labelLight,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    primary: false,
                    crossAxisSpacing: AppSizes.defaultBtwItems,
                    mainAxisSpacing: AppSizes.defaultBtwItems,
                    crossAxisCount: 2,
                    childAspectRatio: 2.0,
                    children: [
                      _container(
                        child: _title(
                          title: '225 days',
                          subtitle: 'Current streak',
                        ),
                      ),
                      _container(
                        child: _title(
                          title: '95%',
                          subtitle: 'Completation rate',
                        ),
                      ),
                      _container(
                        child: _title(
                          title: '499',
                          subtitle: 'Habit completed',
                        ),
                      ),
                      _container(
                        child: _title(
                          title: '386',
                          subtitle: 'Total perfect days',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Column _title({required String title, required String subtitle}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: AppSizes.fontXl,
          fontWeight: FontWeight.w700,
        ),
      ),
      Text(
        subtitle,
        style: TextStyle(
          fontSize: AppSizes.fontMd,
          fontWeight: FontWeight.w500,
          color: AppColors.labelLight,
        ),
      ),
    ],
  );
}

Container _container({required Widget child}) {
  return Container(
    padding: EdgeInsets.all(AppSizes.paddingLg),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      border: Border.all(color: AppColors.lightBorder, width: 0.4),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withValues(alpha: 0.1),
          spreadRadius: 2,
          blurRadius: 7,
          offset: Offset(0, 5),
        ),
      ],
    ),
    child: child,
  );
}
