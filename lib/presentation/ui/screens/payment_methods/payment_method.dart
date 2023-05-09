import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:ecommerse/presentation/ui/resourses/app_icons.dart';
import 'package:ecommerse/presentation/ui/resourses/app_styles.dart';
import 'package:ecommerse/presentation/ui/widgets/app_custompadding.dart';
import 'package:ecommerse/presentation/ui/screens/checkout_screen/checkout_screen.dart';
import 'package:ecommerse/presentation/ui/screens/delivery/delivery_data.dart';
import 'package:ecommerse/presentation/ui/screens/delivery/delivery_screen.dart';
import 'package:ecommerse/presentation/ui/widgets/w_appbar.dart';
import 'package:ecommerse/presentation/ui/widgets/w_bottomview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 96),
        child: WAppBarView(
          title: 'Payment Methods',
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: AppCustomPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                'Delivery Information : ',
                style: Styles.getLabelStyle().copyWith(fontSize: 20),
              ),
              const SizedBox(height: 18),
              _getAddressCard(),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Payment Method :',
                  style: Styles.getLabelStyle().copyWith(fontSize: 20),
                ),
              ),
              _getPaymentMethods(),
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

  _getPaymentMethods() => Column(
        children: [
          _getPaymentOption(
            checkFunction: () {},
            title: 'Debit/Credit Card',
            iconAsset: AppIcons.debitIcon,
          ),
          _getPaymentOption(
            checkFunction: () {},
            title: 'Amazon Pay',
            iconAsset: AppIcons.amazonpay,
          ),
          _getPaymentOption(
            checkFunction: () {},
            title: 'PayPal',
            iconAsset: AppIcons.paypal,
          ),
          _getPaymentOption(
            checkFunction: () {},
            title: 'Cash on Delivery',
            iconAsset: AppIcons.cash,
          ),
        ],
      );

  _getPaymentOption(
          {required String title,
          required String iconAsset,
          required Function checkFunction}) =>
      Container(
        margin: const EdgeInsets.symmetric(vertical: 9),
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(iconAsset),
                const SizedBox(width: 28),
                Text(
                  title,
                  style: Styles.getLabelStyle(),
                ),
              ],
            ),
            Transform.scale(
              scale: 1.4,
              child: Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: AppColors.primaryColor,
                ),
                child: Checkbox(
                    shape: const CircleBorder(),
                    activeColor: AppColors.primaryColor,
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value;
                        checkFunction();
                      });
                    }),
              ),
            )
          ],
        ),
      );
  _getAddressCard() => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        width: double.infinity,
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
                        builder: (context) => DeliveryInformationScreen(),
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
