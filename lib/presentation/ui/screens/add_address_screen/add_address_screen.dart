import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:ecommerse/presentation/ui/resourses/app_styles.dart';
import 'package:ecommerse/presentation/ui/resourses/customwidgets/app_custompadding.dart';
import 'package:ecommerse/presentation/ui/resourses/customwidgets/customtextfield.dart';
import 'package:ecommerse/presentation/ui/widgets/w_appbar.dart';
import 'package:ecommerse/presentation/ui/widgets/w_bottomview.dart';
import 'package:flutter/material.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerAddress01 = TextEditingController();
  TextEditingController controllerAddress02 = TextEditingController();
  TextEditingController controllerCity = TextEditingController();
  TextEditingController controllerCountry = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 94),
        child: WAppBarView(
          title: 'Add Address',
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: AppColors.colorE5E5E5,
              thickness: 1,
            ),
            const SizedBox(
              height: 30,
            ),
            AppCustomPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add New Address',
                    style: Styles.getLabelStyle().copyWith(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Fill The Given Details And Create New Shipping Address',
                    style: Styles.getOnBoardingSubTitleStyle().copyWith(
                      color: AppColors.colorAAAAAAA,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 25),
                  _addPersonalData(
                    title: 'Full Name',
                    controller: controllerName,
                  ),
                  _addPersonalData(
                    title: 'Phone Number',
                    controller: controllerPhone,
                  ),
                  _addPersonalData(
                    title: 'Address 01',
                    controller: controllerAddress01,
                  ),
                  _addPersonalData(
                    title: 'Address 02 (Optional)',
                    controller: controllerAddress02,
                  ),
                  _addPersonalData(
                    title: 'City',
                    controller: controllerCity,
                  ),
                  _addPersonalData(
                    title: 'Country',
                    controller: controllerCountry,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: WViewBottomNavigationBar(
        buttonTitle: 'SaveAddress',
        onButtonPressed: () {},
      ),
    );
  }

  _addPersonalData(
          {required String title, required TextEditingController controller}) =>
      Container(
        margin: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Styles.getLabelStyle().copyWith(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextfield(
              controller: controller,
              obscureText: false,
              hintText: 'Enter $title',
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      );
}
