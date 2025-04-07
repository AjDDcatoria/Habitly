import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitly/src/components/label_input.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/constants/strings/icon_constants.dart';
import 'package:habitly/src/features/auth/presentation/widgets/footer_app_bar.dart';
import 'package:habitly/src/features/main_screens/presentation/widgets/home_page_filter_toggle_widget.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CreateNewHabitPage extends StatelessWidget {
  const CreateNewHabitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      AppColors.lightCream,
      AppColors.peach,
      AppColors.taupe,
      AppColors.beige,
      AppColors.creamOrange,
      AppColors.coral,
      AppColors.softPink,
      AppColors.candyPink,
      AppColors.lavenderPink,
      AppColors.periwinkle,
      AppColors.babyBlue,
      AppColors.mutedTeal,
      AppColors.skyBlue,
      AppColors.mintGreen,
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.close),
        ),
        title: Text('Create New Habit'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.paddingLg),
          child: Center(
            child: Column(
              spacing: AppSizes.defaultBtwSections,
              children: [
                ToggleSwitch(
                  initialLabelIndex: 0,
                  minHeight: 55.0,
                  fontSize: 15,
                  minWidth: double.infinity,
                  inactiveBgColor: AppColors.lightGrey,
                  activeFgColor: Colors.white,
                  totalSwitches: 2,
                  customTextStyles: [TextStyle(fontWeight: FontWeight.w600)],
                  labels: ['Regular Habit', 'One-Time Task'],
                  onToggle: (index) {},
                ),
                LabelInput(
                  label: 'Habit Name',
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Habit Name'),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Icon', style: TextStyle(fontSize: 16.0)),
                          TextButton.icon(
                            onPressed: () {},
                            iconAlignment: IconAlignment.end,
                            icon: Icon(Iconsax.arrow_right_1_copy, size: 22.0),
                            label: Text(
                              'View all',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: 12.0,
                          children:
                              allIcons
                                  .map(
                                    (buttonIcon) =>
                                        _iconButton(buttonIcon, context),
                                  )
                                  .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    spacing: AppSizes.defaultBtwItems,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Color'),
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 20.0,
                        runAlignment: WrapAlignment.center,
                        children:
                            colors
                                .map(
                                  (color) => Container(
                                    height: 64,
                                    width: 64,
                                    decoration: BoxDecoration(
                                      color: color,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    spacing: AppSizes.defaultBtwItems,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Repeat'),
                      HomePageFilterToggleWidget(
                        currentIndex: 0,
                        labels: ['Daily', 'Weekly', 'Monthly'],
                        onPressed: (index) {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    spacing: AppSizes.defaultBtwItems,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dot it at:'),
                      HomePageFilterToggleWidget(
                        currentIndex: 0,
                        labels: ['Morning', 'Afternoon', 'Evening'],
                        onPressed: (index) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: FooterAppBar(
        child: ElevatedButton(onPressed: () {}, child: Text('Save')),
      ),
    );
  }

  OutlinedButton _iconButton(String buttonIcon, BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Text(buttonIcon, style: Theme.of(context).textTheme.headlineLarge),
    );
  }
}
