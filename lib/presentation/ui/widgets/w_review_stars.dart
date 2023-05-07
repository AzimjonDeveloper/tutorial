import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:ecommerse/presentation/ui/resourses/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GetReviewStars extends StatelessWidget {
  const GetReviewStars({
    Key? key,
    required this.mark,
    this.width = 14,
  }) : super(key: key);
  final int mark;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) => SvgPicture.asset(
          width: width,
          AppIcons.star,
          colorFilter: ColorFilter.mode(
            index <= mark
                ? AppColors.reviewEnabledColor
                : AppColors.reviewDisabledColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
