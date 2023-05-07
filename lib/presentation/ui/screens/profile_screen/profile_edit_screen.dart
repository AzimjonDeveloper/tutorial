import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:ecommerse/presentation/ui/resourses/app_icons.dart';
import 'package:ecommerse/presentation/ui/resourses/app_images.dart';
import 'package:ecommerse/presentation/ui/resourses/app_styles.dart';
import 'package:ecommerse/presentation/ui/resourses/customwidgets/app_custompadding.dart';
import 'package:ecommerse/presentation/ui/screens/profile_screen/profile_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  TextEditingController controllerName =
      TextEditingController(text: Profile.azimProfile.name);
  TextEditingController controllerEmail =
      TextEditingController(text: Profile.azimProfile.email);
  TextEditingController controllerPass =
      TextEditingController(text: Profile.azimProfile.password);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _getAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: AppCustomPadding(
          child: Column(
            children: [
              _getUserInfo(),
              const SizedBox(height: 50),
              ProfileCustomTextfield(
                controller: controllerName,
                obscureText: false,
              ),
              _getSpace(),
              ProfileCustomTextfield(
                controller: controllerEmail,
                obscureText: false,
              ),
              _getSpace(),
              ProfileCustomTextfield(
                controller: controllerPass,
                obscureText: true,
              ),
              _getSpace(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                alignment: Alignment.center,
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColors.gray,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${Profile.azimProfile.dateofbirth.year}/${Profile.azimProfile.dateofbirth.month}/${Profile.azimProfile.dateofbirth.day}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: 'Be Vietnam Pro',
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: Profile.azimProfile.dateofbirth,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2023),
                        );
                        setState(() {
                          Profile.azimProfile.dateofbirth = newDate!;
                        });
                      },
                      child: SvgPicture.asset(
                        AppIcons.datePick,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getAppBar() => AppBar(
        toolbarHeight: 96,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleSpacing: 10,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              AppIcons.arrowBack,
              width: 10,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(top: 24),
              padding: const EdgeInsets.all(15),
              child: Text(
                'Save',
                style: Styles.getItemPriceStyle().copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
        title: Text(
          'Edit Profile',
          style: Styles.getPageTitleStyle(),
        ),
      );
  _getUserInfo() => Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  AppImages.avatarImage,
                ),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle,
            ),
            width: 150,
            height: 150,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            Profile.azimProfile.name,
            style: Styles.getPageTitleStyle().copyWith(fontSize: 20),
          ),
          const SizedBox(height: 6),
          Text(
            Profile.azimProfile.email,
            style: Styles.getRegButtonTextStyle().copyWith(
              color: AppColors.colorAAAAAAA,
            ),
          ),
        ],
      );
  _getSpace() => const SizedBox(
        height: 35,
      );

  Widget ProfileCustomTextfield(
          {required TextEditingController controller,
          required bool obscureText}) =>
      TextField(
        obscureText: obscureText,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          fontFamily: 'Be Vietnam Pro',
        ),
        cursorColor: AppColors.primaryColor,
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: AppColors.primaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: AppColors.colorE5E5E5,
            ),
          ),
        ),
      );
}
