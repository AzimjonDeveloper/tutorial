import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:ecommerse/presentation/ui/resourses/app_styles.dart';
import 'package:flutter/material.dart';

class WViewAddress extends StatelessWidget {
  const WViewAddress({
    Key? key,
    required this.name,
    required this.address,
    this.addDetail = '',
    this.width = double.infinity,
  }) : super(key: key);
  final double width;
  final String name;
  final String address;
  final String addDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      width: width,
      decoration:
          BoxDecoration(border: Border.all(color: AppColors.colorE5E5E5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: Styles.getTextActionStyle().copyWith(
              color: AppColors.secondaryBlack,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            address,
            style: Styles.getLabelStyle().copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          Text(
            addDetail,
            style: Styles.getLabelStyle().copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
