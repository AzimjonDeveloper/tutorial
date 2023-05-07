import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:ecommerse/presentation/ui/resourses/app_icons.dart';
import 'package:ecommerse/presentation/ui/resourses/app_images.dart';
import 'package:ecommerse/presentation/ui/resourses/app_styles.dart';
import 'package:ecommerse/presentation/ui/widgets/w_review_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WProductsView extends StatelessWidget {
  const WProductsView({
    Key? key,
    required this.tag,
    required this.onTap,
    required this.imageAsset,
    required this.name,
    required this.price,
  }) : super(key: key);
  final String tag;
  final GestureTapCallback onTap;
  final double price;
  final String name;
  final String imageAsset;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 169,
            height: 169,
            decoration: BoxDecoration(
              color: AppColors.colorF7F7F7,
            ),
            padding: const EdgeInsets.all(20),
            child: Hero(
              tag: tag,
              child: Image.asset(
                imageAsset,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const GetReviewStars(mark: 4),
          const SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: Styles.getLabelStyle(),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            '\$$price',
            style: Styles.getItemPriceStyle(),
          ),
        ],
      ),
    );
  }
}
