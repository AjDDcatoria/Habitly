import 'package:flutter/material.dart';
import 'package:habitly/src/constants/sizes.dart';

class MainScreenAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  const MainScreenAppBarWidget({
    super.key,
    required this.title,
    required this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 50.0,
      leading: Container(
        margin: EdgeInsets.only(left: AppSizes.paddingLg),
        child: Image.asset('assets/images/logo.png'),
      ),
      centerTitle: true,
      title: Text(title, style: Theme.of(context).textTheme.headlineSmall),
      actions: actions,
    );
  }
}
