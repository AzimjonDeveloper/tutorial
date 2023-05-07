import 'package:ecommerse/presentation/ui/resourses/customwidgets/app_regbutton.dart';
import 'package:ecommerse/presentation/ui/resourses/customwidgets/brand_collection.dart';
import 'package:ecommerse/presentation/ui/screens/reset_page/reset_page.dart';
import 'package:flutter/material.dart';

import '../../resourses/app_colors.dart';
import '../../resourses/app_styles.dart';
import '../../resourses/customwidgets/app_custompadding.dart';
import '../../resourses/customwidgets/customtextfield.dart';

class ForgetPage extends StatelessWidget {
  TextEditingController controllerEmailReset = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: AppCustomPadding(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RegistrationHeadline(
                  titleText: 'Forget',
                  subtitleText: 'Forget your password',
                ),
                Column(
                  children: [
                    Text(
                      'Please enter your email address below you will receive a link to create a new password via email',
                      style: Styles.getOnBoardingSubTitleStyle()
                          .copyWith(color: AppColors.secondaryBlack),
                    ),
                    CustomTextfield(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      controller: controllerEmailReset,
                      hintText: 'Email address',
                      obscureText: false,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.034,
                ),
                RegistrationButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) {
                          return ResetPage();
                        },
                      ),
                    );
                  },
                  text: 'Continue',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
