import 'package:flutter/material.dart';
import 'package:habitly/src/components/wide_container.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/constants/strings/sign_up_steps_constants.dart';
import 'package:habitly/src/features/auth/presentation/widgets/page_subtitle_widget.dart';
import 'package:habitly/src/features/auth/presentation/widgets/page_title_widget.dart';
import 'package:habitly/src/features/auth/presentation/widgets/sign_up_step_widget.dart';

class OrganizedPage extends StatefulWidget {
  final int? selectedOrganized;
  final ValueChanged<int?> onOrganizedSelected;

  const OrganizedPage({
    super.key,
    this.selectedOrganized,
    required this.onOrganizedSelected,
  });

  @override
  State<OrganizedPage> createState() => _OrganizedPageState();
}

class _OrganizedPageState extends State<OrganizedPage> {
  void _setSelectedOrganized(int? index) {
    widget.onOrganizedSelected(index); // Notify parent
  }

  @override
  Widget build(BuildContext context) {
    return StepPageWidget(
      title: PageTitle(
        fTitle: 'What influence you to become ',
        hTitle: 'organized',
        lTitle: '? 🧘‍♂️',
      ),
      subtitle: PageSubtitle(
        subtitle:
            'Understanding your motivations helps us align Habitly with your goals. Select all that apply.',
      ),
      content: Column(
        spacing: AppSizes.defaultBtwItems,
        children:
            organizedButtons.asMap().entries.map((entry) {
              final index = entry.key;
              final button = entry.value;
              final isSelected = widget.selectedOrganized == index;

              return WideContainer(
                child: OutlinedButton.icon(
                  onPressed:
                      () => _setSelectedOrganized(isSelected ? null : index),
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
