import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:ecommerse/presentation/ui/resourses/app_icons.dart';
import 'package:ecommerse/presentation/ui/screens/cart/cart_screen.dart';
import 'package:ecommerse/presentation/ui/screens/home/home_screen.dart';
import 'package:ecommerse/presentation/ui/screens/profile_screen/profile_screen.dart';
import 'package:ecommerse/presentation/ui/screens/main/wishlist_screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        physics: const BouncingScrollPhysics(),
        children: const [
          HomeScreen(),
          WishlistScreen(),
          CartScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 94,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGray,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: TabBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          indicatorColor: Colors.transparent,
          controller: tabController,
          tabs: [
            SvgPicture.asset(
              currentIndex == 0
                  ? AppIcons.home_enabled
                  : AppIcons.home_disabled,
              width: 24,
            ),
            SvgPicture.asset(
              currentIndex == 1
                  ? AppIcons.wishlist_enabled
                  : AppIcons.wishlist_disabled,
              width: 24,
            ),
            SvgPicture.asset(
              currentIndex == 2
                  ? AppIcons.cart_enabled
                  : AppIcons.cart_disabled,
              width: 24,
            ),
            SvgPicture.asset(
              currentIndex == 3
                  ? AppIcons.profile_enabled
                  : AppIcons.profile_disabled,
              width: 24,
            ),
          ],
        ),
      ),
    );
  }
}
