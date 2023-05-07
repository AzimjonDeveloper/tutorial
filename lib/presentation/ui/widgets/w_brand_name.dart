import 'package:flutter/material.dart';
import '../resourses/app_colors.dart';
import '../resourses/app_styles.dart';

class WBrandName extends StatelessWidget {
  const WBrandName({
    this.fontSize = 38,
    super.key,
  });
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: Styles.getLogoStyle().copyWith(
          color: AppColors.secondaryBlack,
          fontSize: fontSize,
        ),
        text: 'Swap',
        children: [
          TextSpan(
            text: 'wide',
            style: Styles.getLogoStyle().copyWith(fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}
