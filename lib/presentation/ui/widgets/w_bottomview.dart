import 'package:ecommerse/presentation/ui/resourses/customwidgets/app_regbutton.dart';
import 'package:flutter/material.dart';

class WViewBottomNavigationBar extends StatelessWidget {
  const WViewBottomNavigationBar({
    Key? key,
    required this.buttonTitle,
    required this.onButtonPressed,
  }) : super(key: key);
  final String buttonTitle;
  final Function onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        bottom: 30,
        top: 20,
      ),
      child: RegistrationButton(
        text: buttonTitle,
        onPressed: onButtonPressed,
      ),
    );
  }
}
