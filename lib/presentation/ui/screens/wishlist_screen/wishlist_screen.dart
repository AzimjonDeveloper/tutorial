import 'package:ecommerse/presentation/ui/resourses/app_icons.dart';
import 'package:ecommerse/presentation/ui/widgets/app_custompadding.dart';
import 'package:ecommerse/presentation/ui/screens/home/products_data.dart';
import 'package:ecommerse/presentation/ui/widgets/w_items_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/w_appbar.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 96),
        child: WAppBarView(
          title: 'Wishlist',
        ),
      ),
      body: AppCustomPadding(
        child: GridView(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 260,
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
          ),
          children: List.generate(
            12,
            (index) => Stack(
              children: [
                WProductsView(
                  tag: 'product_$index',
                  onTap: Product.itemsdata[index].onTap,
                  imageAsset: Product.itemsdata[index].imageUrl,
                  name: Product.itemsdata[index].name,
                  price: Product.itemsdata[index].price,
                ),
                Positioned(
                  top: 15,
                  right: 15,
                  child: SvgPicture.asset(
                    AppIcons.wishIcon,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
