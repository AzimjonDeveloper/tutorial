import 'package:ecommerse/presentation/ui/resourses/app_images.dart';
import 'package:ecommerse/presentation/ui/resourses/app_styles.dart';
import 'package:ecommerse/presentation/ui/screens/loading_screen/loading_screen.dart';
import 'package:ecommerse/presentation/ui/widgets/app_custompadding.dart';
import 'package:ecommerse/presentation/ui/widgets/customtextfield.dart';
import 'package:ecommerse/presentation/ui/widgets/w_appbar.dart';
import 'package:ecommerse/presentation/ui/widgets/w_bottomview.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerNumber = TextEditingController();
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerCVV = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 94),
        child: WAppBarView(title: 'Checkout'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: AppCustomPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: Image.asset(AppImages.creditcard),
              ),
              const SizedBox(
                height: 40,
              ),
              _getCardInfo(
                title: 'Card Holder Name',
                controller: controllerName,
                width: double.infinity,
                hintText: 'Saul Goodmate',
                textInputAction: TextInputAction.next,
              ),
              _getCardInfo(
                title: 'Card Number',
                controller: controllerName,
                width: double.infinity,
                hintText: '0123   4567   8901   2345',
                textInputAction: TextInputAction.next,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _getCardInfo(
                    title: 'Expiry Date',
                    controller: controllerName,
                    width: 168,
                    hintText: '09/28',
                    textInputAction: TextInputAction.next,
                  ),
                  _getCardInfo(
                    title: 'CVV',
                    controller: controllerName,
                    width: 168,
                    hintText: '235',
                    textInputAction: TextInputAction.next,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: WViewBottomNavigationBar(
        onButtonPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => LoadingScreen(index: 1),
            ),
          );
        },
        buttonTitle: 'Pay Now',
      ),
    );
  }

  _getCardInfo({
    required String title,
    required TextEditingController controller,
    required double width,
    required String hintText,
    bool obscureText = false,
    required TextInputAction textInputAction,
  }) {
    return Container(
      width: width,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Styles.getLabelStyle().copyWith(fontSize: 18),
          ),
          _getMinorSpace(),
          CustomTextfield(
            controller: controller,
            textInputAction: textInputAction,
            hintText: hintText,
            obscureText: obscureText,
          ),
        ],
      ),
    );
  }

  _getMinorSpace() => const SizedBox(height: 12);
}
