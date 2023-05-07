import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:ecommerse/presentation/ui/resourses/app_images.dart';
import 'package:ecommerse/presentation/ui/resourses/app_styles.dart';
import 'package:flutter/cupertino.dart';

class WCategory extends StatelessWidget {
  const WCategory({required this.text, required this.icon, super.key});

  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: AppColors.colorE5E5E5,
              ),
            ),
            child: Image.asset(
              icon,
              width: 30,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: Styles.getLabelStyle(),
          ),
        ],
      ),
    );
  }
}
