import 'package:flutter/material.dart';
import 'package:habitly/src/components/wide_container.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/constants/strings/sign_up_steps_constants.dart';
import 'package:habitly/src/features/auth/presentation/widgets/page_subtitle_widget.dart';
import 'package:habitly/src/features/auth/presentation/widgets/page_title_widget.dart';
import 'package:habitly/src/features/auth/presentation/widgets/sign_up_step_widget.dart';

class AchievePage extends StatefulWidget {
  final int? selectedAchieve;
  final ValueChanged<int?> onAchieveSelected;

  const AchievePage({
    super.key,
    this.selectedAchieve,
    required this.onAchieveSelected,
  });

  @override
  State<AchievePage> createState() => _AchievePageState();
}

class _AchievePageState extends State<AchievePage> {
  void _setSelectedProcrastinate(int? index) {
    widget.onAchieveSelected(index); // Notify parent
  }

  @override
  Widget build(BuildContext context) {
    return StepPageWidget(
      title: PageTitle(
        fTitle: 'What do you want to ',
        hTitle: 'achieve ',
        lTitle: 'with Habitly 🎯',
      ),
      subtitle: PageSubtitle(
        subtitle:
            'Your aspirations guide our efforts to support and empower you on your journey. Select all that apply.',
      ),
      content: Column(
        spacing: AppSizes.defaultBtwItems,
        children:
            achieveButtons.asMap().entries.map((entry) {
              final index = entry.key;
              final button = entry.value;
              final isSelected = widget.selectedAchieve == index;

              return WideContainer(
                child: OutlinedButton.icon(
                  onPressed:
                      () =>
                          _setSelectedProcrastinate(isSelected ? null : index),
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
