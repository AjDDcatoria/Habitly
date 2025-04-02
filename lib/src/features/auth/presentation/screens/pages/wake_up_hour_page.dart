import 'package:flutter/material.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/features/auth/presentation/widgets/page_subtitle_widget.dart';
import 'package:habitly/src/features/auth/presentation/widgets/page_title_widget.dart';
import 'package:habitly/src/features/auth/presentation/widgets/scroll_number_picker.dart';
import 'package:habitly/src/features/auth/presentation/widgets/sign_up_step_widget.dart';

class WakeUpHourPage extends StatefulWidget {
  const WakeUpHourPage({super.key});

  @override
  State<WakeUpHourPage> createState() => _WakeUpHourPageState();
}

class _WakeUpHourPageState extends State<WakeUpHourPage> {
  int _currentHour = 7;
  int _currentMinutes = 0;

  @override
  Widget build(BuildContext context) {
    return StepPageWidget(
      title: PageTitle(
        fTitle: 'What time do you usually',
        hTitle: ' wake up ',
        lTitle: '☀️',
      ),
      subtitle: PageSubtitle(
        subtitle:
            'Setting your wake-up time help us create your personalized habit schedule.',
      ),
      content: Row(
        spacing: AppSizes.defaultBtwItems,
        children: <Widget>[
          Expanded(
            child: NumberScrollPicker(
              currentValue: _currentHour,
              minValue: 1,
              maxValue: 12,
              onChange: (value) => setState(() => _currentHour = value),
            ),
          ),
          Stack(
            children: [
              NumberScrollPicker(
                currentValue: _currentMinutes,
                minValue: 0,
                maxValue: 59,
                width: MediaQuery.of(context).size.width / 2.4,
                onChange: (value) => setState(() => _currentMinutes = value),
              ),
              Positioned.fill(
                top: MediaQuery.of(context).size.height / 3.8,
                left: 125,
                child: Text(
                  'AM',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
