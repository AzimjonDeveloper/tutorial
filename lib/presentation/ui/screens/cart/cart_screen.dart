import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:ecommerse/presentation/ui/resourses/app_icons.dart';
import 'package:ecommerse/presentation/ui/resourses/app_styles.dart';
import 'package:ecommerse/presentation/ui/widgets/app_custompadding.dart';
import 'package:ecommerse/presentation/ui/screens/home/products_data.dart';
import 'package:ecommerse/presentation/ui/widgets/w_appbar.dart';
import 'package:ecommerse/presentation/ui/widgets/w_button.dart';
import 'package:ecommerse/presentation/ui/widgets/w_review_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 96),
        child: WAppBarView(
          title: 'Card',
        ),
      ),
      body: AppCustomPadding(
        child: _getGridView(),
      ),
    );
  }

  _getGridView() => GridView(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 30,
          crossAxisCount: 1,
          mainAxisExtent: 180,
        ),
        children: List.generate(
          Product.itemsdata.length,
          (index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Container(
                      color: AppColors.colorF7F7F7,
                      padding: const EdgeInsets.all(26),
                      child: Image.asset(
                        Product.itemsdata[index].imageUrl,
                        width: 128,
                        height: 128,
                      ),
                    ),
                    Positioned(
                      right: 16,
                      top: 16,
                      child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Center(
                                    child: SvgPicture.asset(
                                  AppIcons.warningIcon,
                                  width: 62,
                                )),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Delete this Product?',
                                      style: Styles.getLabelStyle()
                                          .copyWith(fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text('Do you want to delete this product?',
                                        textAlign: TextAlign.center,
                                        style: Styles.getRegButtonTextStyle()
                                            .copyWith(
                                          color: AppColors.colorAAAAAAA,
                                        )),
                                    const SizedBox(
                                      height: 42,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        WButton(
                                          text: 'Yes',
                                          onTap: () {},
                                        ),
                                        WButton(
                                          text: 'No',
                                          onTap: () {},
                                          color: const Color(0xFFFFA305),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          child: SvgPicture.asset(AppIcons.trashIcon)),
                    ),
                  ],
                ),
                Container(
                  width: 155,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetReviewStars(
                        mark: Product.itemsdata[index].mark,
                        width: 17,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        Product.itemsdata[index].name,
                        style: Styles.getLabelStyle().copyWith(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '\$ ${Product.itemsdata[index].price}',
                        style: Styles.getItemPriceStyle().copyWith(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 34,
                      ),
                      _getCounter(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );
  _getCounter() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (counter > 1) {
                  counter -= 1;
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.colorF5F5F5,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 26,
              height: 26,
              child: const Icon(
                Icons.remove,
                color: Colors.black,
                size: 19,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              counter.toString(),
              style: Styles.getLabelStyle(),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                counter += 1;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 26,
              height: 26,
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 19,
              ),
            ),
          ),
        ],
      );
}
