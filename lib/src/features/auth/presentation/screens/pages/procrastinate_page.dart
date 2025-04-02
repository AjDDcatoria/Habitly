import 'package:flutter/material.dart';
import 'package:habitly/src/components/wide_container.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/constants/strings/sign_up_steps_constants.dart';
import 'package:habitly/src/features/auth/presentation/widgets/page_subtitle_widget.dart';
import 'package:habitly/src/features/auth/presentation/widgets/page_title_widget.dart';
import 'package:habitly/src/features/auth/presentation/widgets/sign_up_step_widget.dart';

class ProcrastinatePage extends StatefulWidget {
  final int? selectedProcrastinate;
  final ValueChanged<int?> onProcrastinateSelected;

  const ProcrastinatePage({
    super.key,
    this.selectedProcrastinate,
    required this.onProcrastinateSelected,
  });

  @override
  State<ProcrastinatePage> createState() => _ProcrastinatePageState();
}

class _ProcrastinatePageState extends State<ProcrastinatePage> {
  void _setSelectedProcrastinate(int? index) {
    widget.onProcrastinateSelected(index); // Notify parent
  }

  @override
  Widget build(BuildContext context) {
    return StepPageWidget(
      title: PageTitle(
        fTitle: 'Do you often ',
        hTitle: 'procrastinate',
        lTitle: '? 👀',
      ),
      subtitle: PageSubtitle(
        subtitle:
            'Understanding your procrastination tendencies help us tailor strategies to overcome them.',
      ),
      content: Column(
        spacing: AppSizes.defaultBtwItems,
        children:
            procrastinateButtons.asMap().entries.map((entry) {
              final index = entry.key;
              final button = entry.value;
              final isSelected = widget.selectedProcrastinate == index;

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
