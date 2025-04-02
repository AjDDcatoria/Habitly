import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitly/src/constants/colors.dart';
import 'package:habitly/src/constants/sizes.dart';
import 'package:habitly/src/constants/strings/walkthrough.dart';
import 'package:habitly/src/features/auth/presentation/widgets/footer_app_bar.dart';
import 'package:habitly/src/features/started/widgets/walk_through_page.dart';
import 'package:habitly/src/routes/routes_names.dart';
import 'package:habitly/src/themes/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalkThrough extends StatefulWidget {
  const WalkThrough({super.key});

  @override
  State<WalkThrough> createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final buttonTheme = Theme.of(context).extension<SecondaryButtonTheme>()!;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageViewController,
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
              _tabController.animateTo(index);
            },
            children: <Widget>[
              WalkThroughPageWidget(
                title: WalkThroughStrings.page1Title,
                subtitle: WalkThroughStrings.page1Subtitle,
              ),
              WalkThroughPageWidget(
                title: WalkThroughStrings.page2Title,
                subtitle: WalkThroughStrings.page2Subtitle,
              ),
              WalkThroughPageWidget(
                title: WalkThroughStrings.page3Title,
                subtitle: WalkThroughStrings.page3Subtitle,
              ),
            ],
          ),
          Positioned(
            bottom: 35.0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageViewController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotColor: AppColors.lightBorder,
                    activeDotColor: AppColors.primary,
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: FooterAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSizes.defaultBtwItems,
          children: [
            if (_currentPageIndex < 2) ...[
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.go(RouteNames.welcome);
                  },
                  style: buttonTheme.secondary.style,
                  child: Text("Skip"),
                ),
              ),
            ],
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPageIndex < 2) {
                    _updateCurrentPageIndex(_currentPageIndex + 1);
                  } else {
                    context.go(RouteNames.welcome);
                  }
                },
                child: Text(
                  _currentPageIndex < 2 ? "Continue" : "Let's Get Started",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateCurrentPageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    _tabController.animateTo(index);
  }
}
