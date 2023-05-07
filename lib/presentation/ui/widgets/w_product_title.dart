import 'package:ecommerse/presentation/ui/resourses/app_styles.dart';
import 'package:flutter/material.dart';

class WProductTitle extends StatelessWidget {
  final String text;
  const WProductTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Styles.getLabelStyle().copyWith(
        fontSize: 20,
      ),
      textAlign: TextAlign.left,
    );
  }
}
