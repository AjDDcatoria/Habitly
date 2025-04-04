import 'package:flutter/material.dart';
import 'package:habitly/src/components/wide_container.dart';
import 'package:habitly/src/constants/colors.dart';

class HabitButton extends StatefulWidget {
  final String icon;
  final String title;
  final String color;

  const HabitButton({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  State<HabitButton> createState() => _HabitButtonState();
}

class _HabitButtonState extends State<HabitButton> {
  Color getColor(String color) {
    switch (color) {
      case 'lightCream':
        return AppColors.lightCream;
      case 'peach':
        return AppColors.peach;
      case 'taupe':
        return AppColors.taupe;
      case 'beige':
        return AppColors.beige;
      case 'coral':
        return AppColors.coral;
      case 'softPink':
        return AppColors.softPink;
      case 'candyPink':
        return AppColors.candyPink;
      case 'lavenderPink':
        return AppColors.lavenderPink;
      case 'softPurple':
        return AppColors.softPurple;
      case 'periwinkle':
        return AppColors.periwinkle;
      case 'babyBlue':
        return AppColors.babyBlue;
      case 'mutedTeal':
        return AppColors.mutedTeal;
      case 'skyBlue':
        return AppColors.skyBlue;
      case 'mintGreen':
        return AppColors.mintGreen;
      case 'creamOrange':
        return AppColors.creamOrange;
      default:
        return AppColors.lightBorder;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WideContainer(
      child: ElevatedButton.icon(
        onPressed: () {},
        label: Text(
          widget.title,
          style: TextStyle(
            fontSize: 20.0,
            color: AppColors.darkGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
        icon: Text(
          widget.icon,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: getColor(widget.color),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
