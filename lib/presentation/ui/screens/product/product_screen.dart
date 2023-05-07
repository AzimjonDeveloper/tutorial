import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:ecommerse/presentation/ui/resourses/app_icons.dart';
import 'package:ecommerse/presentation/ui/resourses/app_images.dart';
import 'package:ecommerse/presentation/ui/resourses/app_styles.dart';
import 'package:ecommerse/presentation/ui/resourses/customwidgets/app_custompadding.dart';
import 'package:ecommerse/presentation/ui/resourses/customwidgets/app_regbutton.dart';
import 'package:ecommerse/presentation/ui/widgets/w_product_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({
    Key? key,
    required this.index,
  }) : super(key: key);
  int index;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  PageController controller = PageController();
  int activeIndex = 0;
  int currentColorIndex = 6;
  @override
  Widget build(BuildContext context) {
    void changeColorIndex(int index) {
      setState(() {
        currentColorIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _getAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: AppCustomPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _getPageView(),
              _getSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const WProductTitle(text: 'Smart Watches'),
                  Text(
                    '\$120',
                    style: Styles.getItemPriceStyle(),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: _getStars(4),
                  ),
                  Text(
                    'Available in stock',
                    style: Styles.getLabelStyle().copyWith(
                      color: const Color(0xFF12991F),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Divider(
                thickness: 1,
                color: AppColors.colorCCCCCC,
              ),
              _getSpace(),
              const WProductTitle(text: 'Color Variant'),
              _getSpace(),
              Row(
                children: _getColor(currentColorIndex, changeColorIndex),
              ),
              _getSpace(),
              Divider(
                thickness: 1,
                color: AppColors.colorCCCCCC,
              ),
              const SizedBox(height: 35),
              _getProductDescription(text: 'Brand', property: 'Noise'),
              _getProductDescription(
                  text: 'Model Name', property: 'ColorFit Pulse 2'),
              _getProductDescription(
                  text: 'Colour', property: 'Air Superiority Blue'),
              _getProductDescription(text: 'Style', property: 'Modern'),
              _getSpace(),
              Divider(
                thickness: 1,
                color: AppColors.colorCCCCCC,
              ),
              _getSpace(),
              SizedBox(
                height: 230,
                child: Expanded(
                  child: GridView(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 100,
                      mainAxisSpacing: 20,
                    ),
                    children: List.generate(
                      4,
                      (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.home_enabled,
                            width: 40,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Get Free Delivery',
                            style: Styles.getLabelStyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              _getSpace(),
              Divider(
                thickness: 1,
                color: AppColors.gray,
              ),
              _getSpace(),
              const WProductTitle(text: 'About this Item'),
              const SizedBox(
                height: 15,
              ),
              Text(
                '''Laoreet metus urna pretium ex. Pellentesque quis felis elit. Nunc sit amet nibh et arcu bibendum commodo sit amet non ligula. Vivamus pellentesque lorem in massa ornare consequat a tempor magna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla facilisis velit eget venenatis placerat. Sed efficitur libero in diam vulputate, a pharetra metus mattis. Sed feugiat, quam eget mollis finibus, neque tortor sodales lectus, vel consectetur arcu erat mattis quam. Vestibulum vitae.''',
                style: TextStyle(
                  color: AppColors.gray,
                  height: 1.4,
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(30),
        child: RegistrationButton(
          onPressed: () {},
          text: 'Add to Cart',
        ),
      ),
    );
  }

  List<Widget> _getDots(int n, int activeindex) {
    return List.generate(
      n,
      (index) {
        return Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: activeindex == index
                ? AppColors.primaryColor
                : AppColors.primaryColor.withOpacity(0.4),
          ),
        );
      },
    );
  }

  _getProductDescription({required String text, required String property}) =>
      Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$text: ',
              style: Styles.getLabelStyle().copyWith(fontSize: 18),
            ),
            Text(
              property,
              style: Styles.getLabelStyle().copyWith(
                fontSize: 18,
                color: AppColors.gray,
              ),
            ),
          ],
        ),
      );
  _getPageView() => Column(
        children: [
          SizedBox(
            height: 240,
            child: Expanded(
              child: PageView(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (currentindex) {
                  setState(() {
                    activeIndex = currentindex;
                  });
                },
                children: [
                  Hero(
                    tag: 'product_${widget.index}',
                    child: Image.asset(
                      AppImages.watchProductView,
                      height: 240,
                    ),
                  ),
                  Image.asset(
                    AppImages.watchProductView,
                    height: 240,
                  ),
                  Image.asset(
                    AppImages.watchProductView,
                    height: 240,
                  ),
                  Image.asset(
                    AppImages.watchProductView,
                    height: 240,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: _getDots(4, activeIndex),
          ),
        ],
      );
  _getColor(int currentColorIndex, Function change) => List.generate(
        5,
        (index) => GestureDetector(
          onTap: () {
            change(index);
          },
          child: Container(
            margin: const EdgeInsets.only(
              right: 8,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: currentColorIndex == index
                    ? colorAvailable[index]
                    : Colors.transparent,
              ),
            ),
            padding: const EdgeInsets.all(2),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorAvailable[index],
              ),
            ),
          ),
        ),
      );
  _getAppBar() => AppBar(
        titleSpacing: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColors.secondaryBlack,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(AppIcons.wishlist_disabled),
          ),
          const SizedBox(width: 15),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      );
  List<Widget> _getStars(int mark) => List.generate(
        5,
        (index) => SvgPicture.asset(
          AppIcons.star,
          width: 17,
          colorFilter: ColorFilter.mode(
            mark > index
                ? AppColors.reviewEnabledColor
                : AppColors.reviewDisabledColor,
            BlendMode.srcIn,
          ),
        ),
      );
  _getSpace() => const SizedBox(height: 35);
}

List<Color> colorAvailable = [
  const Color(0xFF396036),
  const Color(0xFFCDBD69),
  const Color(0xFF3B250F),
  const Color(0xFF69ABCE),
  const Color(0xFFC0C0C0),
];
