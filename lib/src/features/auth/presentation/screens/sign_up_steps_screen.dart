import 'package:flutter/material.dart';
import 'package:habitly/src/components/wide_container.dart';
import 'package:habitly/src/features/auth/presentation/screens/pages/achieve_page.dart';
import 'package:habitly/src/features/auth/presentation/screens/pages/end_day_hour_page.dart';
import 'package:habitly/src/features/auth/presentation/screens/pages/focus_page.dart';
import 'package:habitly/src/features/auth/presentation/screens/pages/organized_page.dart';
import 'package:habitly/src/features/auth/presentation/screens/pages/procrastinate_page.dart';
import 'package:habitly/src/features/auth/presentation/screens/pages/sleep_hour_page.dart';
import 'package:habitly/src/features/auth/presentation/screens/pages/wake_up_hour_page.dart';
import 'package:habitly/src/features/auth/presentation/widgets/app_bar_indicator.dart';
import 'package:habitly/src/features/auth/presentation/widgets/footer_app_bar.dart';

class SignUpStepScreens extends StatefulWidget {
  const SignUpStepScreens({super.key});

  @override
  State<SignUpStepScreens> createState() => _SignUpStepScreensState();
}

class _SignUpStepScreensState extends State<SignUpStepScreens>
    with TickerProviderStateMixin {
  // Pageview state
  double _currentPercent = 0.2;
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;
  final int _totalPages = 7;

  // Sleep hour page state
  int? _selectedSleepHour;

  // Procrastinate page state
  int? _selectedProcrastinate;

  // Focus page state
  int? _selectedFocus;

  // Organized page stat
  int? _selectedOrganized;

  // Achieve page stat
  int? _selectedAchieve;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: _totalPages, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  void goToNextPage(index) {
    setState(() {
      _currentPageIndex = index;
    });
    _tabController.animateTo(index);
  }

  incrementPageIndex() {
    switch (_currentPageIndex) {
      case 0:
        if (_selectedSleepHour == null) {
          return null;
        }
      case 3:
        if (_selectedProcrastinate == null) {
          return null;
        }
      case 4:
        if (_selectedFocus == null) {
          return null;
        }
      case 5:
        if (_selectedOrganized == null) {
          return null;
        }
      case 6:
        if (_selectedAchieve == null) {
          return null;
        }
      default:
        return _updateCurrentPageIndex(_currentPageIndex + 1);
    }

    if (_currentPageIndex < _totalPages - 1) {
      return _updateCurrentPageIndex(_currentPageIndex + 1);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarIndicator(
        currentPercent: _currentPercent,
        totalPages: _totalPages,
        currentPage: _currentPageIndex,
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageViewController,
            onPageChanged: (index) => goToNextPage(index),
            children: <Widget>[
              SleepHourPage(
                selectedHour: _selectedSleepHour,
                onHourSelected:
                    (hour) => setState(() => _selectedSleepHour = hour),
              ),
              WakeUpHourPage(),
              EndDayHourPage(),
              ProcrastinatePage(
                selectedProcrastinate: _selectedProcrastinate,
                onProcrastinateSelected:
                    (value) => setState(() => _selectedProcrastinate = value),
              ),
              FocusPage(
                selectedFocus: _selectedFocus,
                onFocusSelected:
                    (value) => setState(() => _selectedFocus = value),
              ),
              OrganizedPage(
                selectedOrganized: _selectedOrganized,
                onOrganizedSelected:
                    (value) => setState(() => _selectedOrganized = value),
              ),
              AchievePage(
                selectedAchieve: _selectedAchieve,
                onAchieveSelected:
                    (value) => setState(() => _selectedAchieve = value),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: FooterAppBar(
        child: WideContainer(
          child: ElevatedButton(
            onPressed: () => incrementPageIndex(),
            child: Text(
              _currentPageIndex < _totalPages - 1 ? "Continue" : "Finish",
            ),
          ),
        ),
      ),
    );
  }

  void _updateCurrentPageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
      _currentPercent += 0.13;
    });
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    _tabController.animateTo(index);
  }
}
