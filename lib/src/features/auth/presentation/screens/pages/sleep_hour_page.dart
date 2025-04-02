import 'package:flutter/material.dart';
import 'package:habitly/src/components/wide_container.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/constants/strings/sign_up_steps_constants.dart';
import 'package:habitly/src/features/auth/presentation/widgets/page_subtitle_widget.dart';
import 'package:habitly/src/features/auth/presentation/widgets/page_title_widget.dart';
import 'package:habitly/src/features/auth/presentation/widgets/sign_up_step_widget.dart';

class SleepHourPage extends StatefulWidget {
  final int? selectedHour;
  final ValueChanged<int?> onHourSelected;

  const SleepHourPage({
    super.key,
    required this.selectedHour,
    required this.onHourSelected,
  });

  @override
  State<SleepHourPage> createState() => _SleepHourPageState();
}

class _SleepHourPageState extends State<SleepHourPage> {
  void _setSelectedHour(int? index) {
    widget.onHourSelected(index); // Notify parent
  }

  @override
  Widget build(BuildContext context) {
    return StepPageWidget(
      title: PageTitle(
        fTitle: 'How long do you usually',
        hTitle: ' sleep ',
        lTitle: 'at night? 😴',
      ),
      subtitle: PageSubtitle(
        subtitle:
            'Understand your sleep patterns helps us tailor your habit tracking experience.',
      ),
      content: Column(
        spacing: AppSizes.defaultBtwItems,
        children:
            hourButtons.asMap().entries.map((entry) {
              final index = entry.key;
              final button = entry.value;
              final isSelected = widget.selectedHour == index;

              return WideContainer(
                child: OutlinedButton.icon(
                  onPressed: () => _setSelectedHour(isSelected ? null : index),
                  style: OutlinedButton.styleFrom(
                    alignment: Alignment.centerLeft,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppSizes.borderRadiusMd,
                      ),
                    ),
                    side: BorderSide(
                      color:
                          isSelected
                              ? AppColors.primary
                              : AppColors.lightBorder,
                      width: isSelected ? 2.0 : 1.0,
                    ),
                  ),
                  icon: Text(
                    '${button['icon']}',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  label: Text(
                    '${button['text']}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
