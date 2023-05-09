import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:ecommerse/presentation/ui/resourses/app_icons.dart';
import 'package:ecommerse/presentation/ui/resourses/app_styles.dart';
import 'package:ecommerse/presentation/ui/widgets/app_custompadding.dart';
import 'package:ecommerse/presentation/ui/screens/add_address_screen/add_address_screen.dart';
import 'package:ecommerse/presentation/ui/screens/checkout_screen/checkout_screen.dart';
import 'package:ecommerse/presentation/ui/screens/delivery/delivery_address.dart';
import 'package:ecommerse/presentation/ui/screens/delivery/delivery_data.dart';
import 'package:ecommerse/presentation/ui/screens/editaddress_screen/edit_address_screen.dart';
import 'package:ecommerse/presentation/ui/widgets/w_appbar.dart';
import 'package:ecommerse/presentation/ui/widgets/w_bottomview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeliveryInformationScreen extends StatefulWidget {
  const DeliveryInformationScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryInformationScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 96),
        child: WAppBarView(
          title: 'Delivery Information',
        ),
      ),
      body: AppCustomPadding(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery Information',
                    style: Styles.getLabelStyle().copyWith(fontSize: 20),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => SelectDeliveryScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Change',
                      style: Styles.getTextActionStyle(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _getAddressCard(),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const AddAddressScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 190,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 63,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.colorE5E5E5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: AppColors.gray,
                            ),
                            Text(
                              'Add address',
                              style: Styles.getOnBoardingSubTitleStyle()
                                  .copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Recent Delivery Address : ',
                style: Styles.getLabelStyle().copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              _getAddress(),
              const SizedBox(
                height: 30,
              ),
              Text(
                'All Delivery Address : ',
                style: Styles.getLabelStyle().copyWith(fontSize: 20),
              ),
              const SizedBox(height: 20),
              _getAddress(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: WViewBottomNavigationBar(
        buttonTitle: 'Checkout',
        onButtonPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const CheckoutScreen(),
            ),
          );
        },
      ),
    );
  }

  _getAddress() => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _getAddressCard(),
            const SizedBox(
              width: 10,
            ),
            _getAddressCard(),
          ],
        ),
      );

  _getAddressCard() => Container(
        width: 250,
        height: 190,
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 16,
        ),
        decoration:
            BoxDecoration(border: Border.all(color: AppColors.colorE5E5E5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Address.data[0].name,
                  style: Styles.getTextActionStyle().copyWith(
                    color: AppColors.secondaryBlack,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const EditAddressScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      AppIcons.paymentEdit,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              Address.data[0].address,
              style:
                  Styles.getLabelStyle().copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            Text(
              Address.data[0].addDetail,
              style:
                  Styles.getLabelStyle().copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
}
