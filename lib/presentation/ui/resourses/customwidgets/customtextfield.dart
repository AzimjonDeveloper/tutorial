import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:flutter/material.dart';
import '../app_fonts.dart';

class CustomTextfield extends StatelessWidget {
  TextEditingController controller;
  TextInputAction textInputAction;
  String hintText;
  bool obscureText;
  TextInputType keyboardType;

  CustomTextfield({
    super.key,
    required this.controller,
    required this.textInputAction,
    required this.hintText,
    required this.obscureText,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.056,
          vertical: 17,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          color: AppColors.gray,
          fontFamily: Fonts.primaryfont,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 2,
            color: AppColors.primaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xE5E5E5E5),
          ),
        ),
      ),
    );
  }
}
