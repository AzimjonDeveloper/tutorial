import 'package:ecommerse/presentation/ui/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class AppCustomPadding extends StatelessWidget {
  final Widget child;
  const AppCustomPadding({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.mainPadding(),
      child: child,
    );
  }
}
