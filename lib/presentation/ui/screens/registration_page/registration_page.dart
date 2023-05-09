import 'package:ecommerse/presentation/ui/widgets/app_custompadding.dart';
import 'package:ecommerse/presentation/ui/widgets/app_regbutton.dart';
import 'package:ecommerse/presentation/ui/screens/loginpage/login_page.dart';
import 'package:flutter/material.dart';

import '../../resourses/app_colors.dart';
import '../../resourses/app_styles.dart';
import '../../widgets/brand_collection.dart';
import '../../widgets/customtextfield.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});
  TextEditingController controllerRegEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerRegPassword = TextEditingController();
  TextEditingController controllerRegPasswordConfirm = TextEditingController();
  double height = 0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: AppCustomPadding(
          child: SizedBox(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RegistrationHeadline(
                  titleText: 'Register',
                  subtitleText: 'Create New Account',
                ),
                Column(
                  children: [
                    CustomTextfield(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: controllerRegEmail,
                      hintText: 'Email',
                      obscureText: false,
                    ),
                    _getSpace(),
                    CustomTextfield(
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      controller: controllerPhone,
                      hintText: 'Email',
                      obscureText: false,
                    ),
                    _getSpace(),
                    CustomTextfield(
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      controller: controllerRegPassword,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    _getSpace(),
                    CustomTextfield(
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      controller: controllerRegPasswordConfirm,
                      hintText: 'Confirm Password',
                      obscureText: true,
                    ),
                  ],
                ),
                Text.rich(
                  TextSpan(
                    text: "By signing below, you agree to the ",
                    style: Styles.getRegPageTextButtonStyle().copyWith(
                      color: AppColors.gray,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Team of use',
                            style: Styles.getRegPageTextButtonStyle(),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: ' and',
                        style: Styles.getRegPageTextButtonStyle().copyWith(
                          color: AppColors.gray,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            ' privacy policy',
                            style: Styles.getRegPageTextButtonStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                RegistrationButton(
                  onPressed: () {},
                  text: 'Sign Up',
                ),
                Text.rich(
                  TextSpan(
                    text: "Already have an account?",
                    style: Styles.getRegButtonTextStyle()
                        .copyWith(color: AppColors.gray),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) {
                                  return LoginPage();
                                },
                              ),
                            );
                          },
                          child: Text(
                            ' Login',
                            style: Styles.getRegButtonTextStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
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
      height: height * 0.033,
    );
  }
}
