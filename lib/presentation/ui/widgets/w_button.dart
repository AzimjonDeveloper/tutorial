import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:ecommerse/presentation/ui/resourses/app_styles.dart';
import 'package:flutter/material.dart';

class WButton extends StatelessWidget {
  WButton({
    Key? key,
    required this.onTap,
    this.color = const Color(0xFFF13005),
    required this.text,
  }) : super(key: key);
  final GestureTapCallback onTap;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(78),
          color: color,
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 15,
        ),
        child: Text(
          text,
          style: Styles.getTextActionStyle().copyWith(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
