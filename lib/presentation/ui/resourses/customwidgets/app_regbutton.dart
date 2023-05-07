import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:ecommerse/presentation/ui/resourses/app_fonts.dart';
import 'package:flutter/material.dart';

class RegistrationButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  const RegistrationButton(
      {required this.onPressed, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
        ),
        width: double.infinity,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: Fonts.primaryfont,
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
