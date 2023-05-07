import 'package:flutter/material.dart';
import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:ecommerse/presentation/ui/resourses/app_fonts.dart';

abstract class Styles {
  static TextStyle getLogoStyle() => TextStyle(
        color: AppColors.primaryColor,
        fontFamily: Fonts.primaryfont,
        fontSize: 32,
        fontWeight: FontWeight.w800,
      );
  static TextStyle getTextActionStyle() => TextStyle(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w700,
        fontSize: 18,
        fontFamily: Fonts.primaryfont,
      );
  static TextStyle getOnBoardingTitleStyle() => TextStyle(
        color: AppColors.secondaryBlack,
        fontWeight: FontWeight.w700,
        fontSize: 26,
        fontFamily: Fonts.primaryfont,
      );
  static TextStyle getOnBoardingSubTitleStyle() => TextStyle(
        color: AppColors.gray,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        fontFamily: Fonts.primaryfont,
        height: 1.4,
      );
  static TextStyle getRegistrationTitleStyle() => TextStyle(
        color: AppColors.secondaryBlack,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        fontFamily: Fonts.primaryfont,
      );

  static TextStyle getRegistrationSubtitleStyle() => TextStyle(
        fontSize: 18,
        fontFamily: Fonts.primaryfont,
        fontWeight: FontWeight.normal,
        color: AppColors.gray,
      );
  static TextStyle getRegButtonTextStyle() => TextStyle(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        fontFamily: Fonts.primaryfont,
      );

  static TextStyle getRegPageTextButtonStyle() => TextStyle(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        fontFamily: Fonts.primaryfont,
      );
  static TextStyle getLabelStyle() => TextStyle(
        color: AppColors.secondaryBlack,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        fontFamily: Fonts.primaryfont,
      );
  static TextStyle getItemPriceStyle() => TextStyle(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w800,
        fontSize: 18,
        fontFamily: Fonts.primaryfont,
      );
  static TextStyle getPageTitleStyle() => TextStyle(
        color: AppColors.secondaryBlack,
        fontWeight: FontWeight.w700,
        fontSize: 22,
        fontFamily: Fonts.primaryfont,
      );
}
