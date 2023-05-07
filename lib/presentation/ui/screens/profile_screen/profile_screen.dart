import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:ecommerse/presentation/ui/resourses/app_icons.dart';
import 'package:ecommerse/presentation/ui/resourses/app_images.dart';
import 'package:ecommerse/presentation/ui/resourses/app_styles.dart';
import 'package:ecommerse/presentation/ui/resourses/customwidgets/app_custompadding.dart';
import 'package:ecommerse/presentation/ui/screens/payment_methods/payment_method.dart';
import 'package:ecommerse/presentation/ui/screens/profile_screen/profile_data.dart';
import 'package:ecommerse/presentation/ui/screens/profile_screen/profile_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool value = false;

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
              const SizedBox(
                height: 50,
              ),
              _getSettingList(),
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
        titleSpacing: 0,
        title: Container(
          margin: const EdgeInsets.only(
            top: 40,
            bottom: 20,
          ),
          child: Text(
            'My Account',
            style: Styles.getPageTitleStyle(),
          ),
        ),
      );
  _getUserInfo() => Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Stack(
            children: [
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
              Positioned(
                right: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const ProfileEditScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        width: 15,
                        height: 15,
                        fit: BoxFit.scaleDown,
                        AppIcons.editIcon,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
  _getSettingList() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitcherRow(
            text: 'Notification',
            onSwitched: () {},
          ),
          Divider(
            thickness: 1,
            color: AppColors.colorDEDEDE,
          ),
          _getSpace(),
          ArrowRow(
            text: 'My Orders',
            onPressed: () {},
          ),
          Divider(
            thickness: 1,
            color: AppColors.colorDEDEDE,
          ),
          _getSpace(),
          ArrowRow(
            text: 'Payment Method',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const PaymentScreen();
                  },
                ),
              );
            },
          ),
          Divider(
            thickness: 1,
            color: AppColors.colorDEDEDE,
          ),
          SwitcherRow(
            text: 'Dark Mode',
            onSwitched: () {},
          ),
          Divider(
            thickness: 1,
            color: AppColors.colorDEDEDE,
          ),
          _getSpace(),
          ArrowRow(
            text: 'Shipping Addresses',
            onPressed: () {},
          ),
          _getDivider(),
          const SizedBox(height: 30),
          TextButton(
              onPressed: () {},
              child: Text(
                'Logout',
                style: Styles.getLabelStyle().copyWith(
                  fontSize: 18,
                  color: AppColors.primaryColor,
                ),
              ))
        ],
      );
  _getDivider() => Divider(
        thickness: 1,
        color: AppColors.colorDEDEDE,
      );
  _getSpace() => const SizedBox(height: 15);

  Widget SwitcherRow({required String text, required Function onSwitched}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Styles.getLabelStyle().copyWith(
            fontSize: 18,
          ),
        ),
        Switch(
          activeColor: AppColors.primaryColor,
          value: value,
          onChanged: (value) {
            setState(() {
              this.value = value;
            });
          },
        ),
      ],
    );
  }

  Widget ArrowRow({required String text, required onPressed}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Styles.getLabelStyle().copyWith(
            fontSize: 18,
          ),
        ),
        GestureDetector(
          onTap: onPressed,
          child: const Icon(
            Icons.arrow_forward,
            size: 28,
          ),
        )
      ],
    );
  }
}
