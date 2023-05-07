import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:flutter/material.dart';
import '../app_images.dart';
import '../app_styles.dart';

class RegistrationHeadline extends StatelessWidget {
  String titleText;
  String subtitleText;

  RegistrationHeadline({
    super.key,
    required this.titleText,
    required this.subtitleText,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: screenHeight * 0.0777,
            bottom: screenHeight * 0.04,
          ),
          width: screenWidth * 0.2045,
          child: Image.asset(AppImages.logo),
        ),
        Text(
          titleText,
          style: Styles.getRegistrationTitleStyle(),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          child: Text(
            subtitleText,
            style: Styles.getRegistrationSubtitleStyle(),
          ),
        ),
      ],
    );
  }
}
