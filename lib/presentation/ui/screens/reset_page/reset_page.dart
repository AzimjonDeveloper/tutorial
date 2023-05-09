import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';

import 'package:flutter/material.dart';
import '../../resourses/app_fonts.dart';
import '../../widgets/app_custompadding.dart';
import '../../widgets/app_regbutton.dart';
import '../../widgets/brand_collection.dart';
import '../../widgets/customtextfield.dart';
import '../loading_screen/loading_screen.dart';

class ResetPage extends StatelessWidget {
  TextEditingController controllerPasswordReset = TextEditingController();
  TextEditingController controllerPasswordResetConfirm =
      TextEditingController();

  ResetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: AppCustomPadding(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              RegistrationHeadline(
                titleText: 'Reset',
                subtitleText: 'Reset your password',
              ),
              const SizedBox(height: 92),
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
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 50, top: 10, right: 30, left: 30),
        child: RegistrationButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const LoadingScreen(index: 0),
              ),
            );
          },
          text: 'Change Password',
        ),
      ),
    );
  }

  Widget _getSpace() => const SizedBox(
        height: 30,
      );
}
