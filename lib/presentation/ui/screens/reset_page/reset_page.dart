import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:ecommerse/presentation/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import '../../resourses/app_fonts.dart';
import '../../resourses/customwidgets/app_custompadding.dart';
import '../../resourses/customwidgets/app_regbutton.dart';
import '../../resourses/customwidgets/brand_collection.dart';
import '../../resourses/customwidgets/customtextfield.dart';

class ResetPage extends StatelessWidget {
  TextEditingController controllerPasswordReset = TextEditingController();
  TextEditingController controllerPasswordResetConfirm =
      TextEditingController();
  double height = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: AppCustomPadding(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RegistrationHeadline(
                  titleText: 'Reset',
                  subtitleText: 'Reset your password',
                ),
                Column(
                  children: [
                    Text(
                      'Enter Your New Password',
                      style: TextStyle(
                        color: AppColors.secondaryBlack,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: Fonts.primaryfont,
                      ),
                    ),
                    _getSpace(),
                    CustomTextfield(
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      controller: controllerPasswordReset,
                      hintText: 'New Password',
                      obscureText: true,
                    ),
                    _getSpace(),
                    CustomTextfield(
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      controller: controllerPasswordResetConfirm,
                      hintText: 'Confirm Password',
                      obscureText: true,
                    ),
                  ],
                ),
                RegistrationButton(
                  onPressed: () {},
                  text: 'Change Password',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getSpace() {
    return SizedBox(
      height: height * 0.034,
    );
  }
}
