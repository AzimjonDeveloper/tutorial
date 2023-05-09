import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:ecommerse/presentation/ui/resourses/app_fonts.dart';
import 'package:ecommerse/presentation/ui/resourses/app_images.dart';
import 'package:ecommerse/presentation/ui/resourses/app_styles.dart';
import 'package:ecommerse/presentation/ui/widgets/app_custompadding.dart';
import 'package:ecommerse/presentation/ui/screens/product/product_screen.dart';
import 'package:ecommerse/presentation/ui/widgets/w_brand_name.dart';
import 'package:ecommerse/presentation/ui/widgets/w_category.dart';
import 'package:ecommerse/presentation/ui/widgets/w_items_view.dart';
import 'package:ecommerse/presentation/ui/widgets/w_product_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerse/presentation/ui/resourses/app_icons.dart';
import 'package:ecommerse/presentation/ui/screens/home/category_data.dart';
import 'products_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  TextEditingController controller = TextEditingController();
  int activePageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        backgroundColor: Colors.white,
        drawer: _getDrawer(),
        appBar: _getAppBar(),
        body: AppCustomPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getSearchField(),
              const SizedBox(
                height: 36,
              ),
              const WProductTitle(text: 'Shop By Category'),
              const SizedBox(
                height: 24,
              ),
              _getCategory(),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 24,
                  top: 50,
                ),
                child: const WProductTitle(text: 'Newest Arrival'),
              ),
              Expanded(
                child: GridView(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 260,
                  ),
                  children: List.generate(
                    Product.itemsdata.length,
                    (index) => WProductsView(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return ProductScreen(
                                index: index,
                              );
                            },
                          ),
                        );
                      },
                      tag: 'product_$index',
                      imageAsset: Product.itemsdata[index].imageUrl,
                      name: Product.itemsdata[index].name,
                      price: Product.itemsdata[index].price,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getDrawerMenu({
    required String text,
    required String icon,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          child: SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: Text(
          text,
          style: Styles.getLabelStyle(),
        ),
      ),
    );
  }

  _getAppBar() => AppBar(
        toolbarHeight: 100,
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    AppIcons.menu,
                    width: 24,
                  ),
                ),
              ),
              const WBrandName(fontSize: 28),
              SizedBox(
                width: 40,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(AppImages.avatarImage),
                ),
              ),
            ],
          ),
        ),
      );
  _getDrawer() => Drawer(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                SvgPicture.asset(AppImages.logoSvg),
                const SizedBox(height: 28),
                const WBrandName(fontSize: 28),
                const SizedBox(height: 50),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Divider(
                    thickness: 1,
                    color: Color(0xFFCCCCCC),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
            _getDrawerMenu(text: 'Gift', icon: AppIcons.gift),
            _getDrawerMenu(text: 'Help', icon: AppIcons.help),
            _getDrawerMenu(text: 'Contact Us', icon: AppIcons.quoteMark),
            _getDrawerMenu(text: 'Privacy Policy', icon: AppIcons.privacy),
            _getDrawerMenu(text: 'Logout', icon: AppIcons.logout),
          ],
        ),
      );
  _getSearchField() => Container(
        margin: const EdgeInsets.only(top: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGray,
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: TextField(
          style: TextStyle(
            fontSize: 14,
            color: AppColors.secondaryBlack,
            fontWeight: FontWeight.w500,
            fontFamily: Fonts.primaryfont,
          ),
          controller: controller,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: 'Search “Smartphone”',
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: Fonts.primaryfont,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 20,
              ),
              child: SvgPicture.asset(AppIcons.search),
            ),
            suffixIcon: InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: SvgPicture.asset(AppIcons.scan),
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(90),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(90),
            ),
          ),
        ),
      );
  _getCategory() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: List.generate(
            categorydata.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                  right: (index == categorydata.length - 1) ? 0.0 : 30.0),
              child: WCategory(
                text: categorydata[index].name,
                icon: categorydata[index].icon,
              ),
            ),
          ),
        ),
      );
}
