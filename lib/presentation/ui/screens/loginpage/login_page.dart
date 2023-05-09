import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:ecommerse/presentation/ui/resourses/app_images.dart';
import 'package:ecommerse/presentation/ui/widgets/app_custompadding.dart';
import 'package:ecommerse/presentation/ui/widgets/brand_collection.dart';
import 'package:ecommerse/presentation/ui/screens/forget_page/forget_page.dart';
import 'package:ecommerse/presentation/ui/screens/registration_page/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:ecommerse/presentation/ui/resourses/app_fonts.dart';
import 'package:ecommerse/presentation/ui/resourses/app_styles.dart';
import 'package:ecommerse/presentation/ui/widgets/customtextfield.dart';
import '../../widgets/app_regbutton.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController controllerLoginEmail = TextEditingController();
  TextEditingController controllerLoginPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AppCustomPadding(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RegistrationHeadline(
                  titleText: 'Welcome Back',
                  subtitleText: 'Login to your account',
                ),
                Column(
                  children: [
                    CustomTextfield(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: controllerLoginEmail,
                      hintText: 'Email',
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                    CustomTextfield(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      controller: controllerLoginPassword,
                      textInputAction: TextInputAction.done,
                      hintText: 'Password',
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) {
                            return ForgetPage();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        fontFamily: Fonts.primaryfont,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                RegistrationButton(
                  onPressed: () {},
                  text: 'Login',
                ),
                Text(
                  'Or',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: Fonts.primaryfont,
                    color: AppColors.gray,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    regAlternative(
                      context: context,
                      imageUrl: AppImages.logoGoogle,
                      text: 'Google',
                      onPressed: () {},
                    ),
                    regAlternative(
                      context: context,
                      imageUrl: AppImages.logoFacebook,
                      text: 'Facebook',
                      onPressed: () {},
                    ),
                  ],
                ),
                Text.rich(
                  TextSpan(
                    text: "Don't have an account?",
                    style: Styles.getRegButtonTextStyle()
                        .copyWith(color: AppColors.gray),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) {
                                  return RegistrationPage();
                                },
                              ),
                            );
                          },
                          child: Text(
                            ' Sign Up ',
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

  Widget regAlternative(
      {required BuildContext context,
      required String imageUrl,
      required String text,
      required Function onPressed}) {
    return InkWell(
      onTap: () => onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 25,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          border: Border.all(
            width: 1,
            color: const Color(0xE5E5E5E5),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 25,
              height: 25,
              child: Image.asset(imageUrl),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: AppColors.secondaryBlack,
                fontSize: 16,
                fontFamily: Fonts.primaryfont,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
