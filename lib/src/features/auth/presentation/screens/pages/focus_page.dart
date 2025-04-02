import 'package:flutter/material.dart';
import 'package:habitly/src/components/wide_container.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/constants/strings/sign_up_steps_constants.dart';
import 'package:habitly/src/features/auth/presentation/widgets/page_subtitle_widget.dart';
import 'package:habitly/src/features/auth/presentation/widgets/page_title_widget.dart';
import 'package:habitly/src/features/auth/presentation/widgets/sign_up_step_widget.dart';

class FocusPage extends StatefulWidget {
  final int? selectedFocus;
  final ValueChanged<int?> onFocusSelected;

  const FocusPage({
    super.key,
    this.selectedFocus,
    required this.onFocusSelected,
  });

  @override
  State<FocusPage> createState() => _FocusPageState();
}

class _FocusPageState extends State<FocusPage> {
  void _setSelectedFocus(int? index) {
    widget.onFocusSelected(index); // Notify parent
  }

  @override
  Widget build(BuildContext context) {
    return StepPageWidget(
      title: PageTitle(
        fTitle: 'Do you often find it hard to ',
        hTitle: 'focus ',
        lTitle: '? 🎯',
      ),
      subtitle: PageSubtitle(
        subtitle:
            'Let us know if focus is a struggle for you so we can provide targeted support.',
      ),
      content: Column(
        spacing: AppSizes.defaultBtwItems,
        children:
            focusButtons.asMap().entries.map((entry) {
              final index = entry.key;
              final button = entry.value;
              final isSelected = widget.selectedFocus == index;

              return WideContainer(
                child: OutlinedButton.icon(
                  onPressed: () => _setSelectedFocus(isSelected ? null : index),
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
