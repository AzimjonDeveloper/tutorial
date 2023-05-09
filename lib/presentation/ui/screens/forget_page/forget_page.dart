import 'package:ecommerse/presentation/ui/widgets/app_regbutton.dart';
import 'package:ecommerse/presentation/ui/widgets/brand_collection.dart';
import 'package:ecommerse/presentation/ui/screens/reset_page/reset_page.dart';
import 'package:flutter/material.dart';

import '../../resourses/app_colors.dart';
import '../../resourses/app_styles.dart';
import '../../widgets/app_custompadding.dart';
import '../../widgets/customtextfield.dart';

class ForgetPage extends StatelessWidget {
  TextEditingController controllerEmailReset = TextEditingController();

  ForgetPage({super.key});

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
                    const SizedBox(
                      height: 40,
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
