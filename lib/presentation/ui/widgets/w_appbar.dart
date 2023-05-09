import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:ecommerse/presentation/ui/resourses/app_icons.dart';
import 'package:ecommerse/presentation/ui/resourses/app_styles.dart';
import 'package:ecommerse/presentation/ui/screens/wishlist_screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WAppBarView extends StatelessWidget {
  const WAppBarView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 1),
        child: Divider(
          color: AppColors.colorDEDEDE,
          thickness: 1,
        ),
      ),
      leading: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            AppIcons.arrowBack,
            width: 10,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      toolbarHeight: 96,
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleSpacing: 10,
      title: Text(
        title,
        style: Styles.getPageTitleStyle(),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const WishlistScreen(),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset(
              AppIcons.wishlist_disabled,
              width: 20,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ],
    );
  }
}
