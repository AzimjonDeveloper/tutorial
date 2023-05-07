import 'package:ecommerse/presentation/ui/resourses/app_colors.dart';
import 'package:ecommerse/presentation/ui/resourses/app_styles.dart';
import 'package:ecommerse/presentation/ui/resourses/customwidgets/app_custompadding.dart';
import 'package:ecommerse/presentation/ui/resourses/customwidgets/customtextfield.dart';
import 'package:ecommerse/presentation/ui/screens/delivery/delivery_data.dart';
import 'package:ecommerse/presentation/ui/widgets/w_appbar.dart';
import 'package:ecommerse/presentation/ui/widgets/w_bottomview.dart';
import 'package:flutter/material.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({Key? key}) : super(key: key);

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  TextEditingController controllerName =
      TextEditingController(text: 'Saul Goodmate');
  TextEditingController controllerPhone =
      TextEditingController(text: '865-5585 57587');
  TextEditingController controllerAddress01 =
      TextEditingController(text: '16 E Birch Hill Road');
  TextEditingController controllerAddress02 =
      TextEditingController(text: 'Near Fairbanks');
  TextEditingController controllerCity =
      TextEditingController(text: 'New York');
  TextEditingController controllerCountry = TextEditingController(text: 'USA');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _getAppBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Divider(
                thickness: 1,
                color: AppColors.colorE5E5E5,
              ),
              AppCustomPadding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _getPersonalData(
                      title: titles[0],
                      controller: controllerName,
                    ),
                    _getPersonalData(
                      title: titles[1],
                      controller: controllerPhone,
                    ),
                    _getPersonalData(
                      title: titles[2],
                      controller: controllerAddress01,
                    ),
                    _getPersonalData(
                      title: titles[3],
                      controller: controllerAddress02,
                    ),
                    _getPersonalData(
                      title: titles[4],
                      controller: controllerCity,
                    ),
                    _getPersonalData(
                      title: titles[5],
                      controller: controllerCountry,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: WViewBottomNavigationBar(
          buttonTitle: 'Save Address',
          onButtonPressed: () {},
        ));
  }

  _getPersonalData(
          {required TextEditingController controller, required String title}) =>
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
              obscureText: false,
              controller: controller,
              hintText: '',
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      );
  _getAppBar() => const PreferredSize(
        preferredSize: Size(double.infinity, 94),
        child: WAppBarView(
          title: 'Edit Address',
        ),
      );
  List<String> titles = [
    'Full Name',
    'Phone Number',
    'Address 01',
    'Address 02',
    'City',
    'Country',
  ];
  List<TextEditingController> info = [];
}
