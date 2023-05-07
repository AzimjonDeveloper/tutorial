import 'package:ecommerse/presentation/ui/screens/delivery/delivery_data.dart';
import 'package:ecommerse/presentation/ui/widgets/w_appbar.dart';
import 'package:ecommerse/presentation/ui/widgets/w_bottomview.dart';
import 'package:ecommerse/presentation/ui/widgets/w_view_address.dart';
import 'package:flutter/material.dart';

class SelectDeliveryScreen extends StatefulWidget {
  const SelectDeliveryScreen({Key? key}) : super(key: key);

  @override
  State<SelectDeliveryScreen> createState() => _SelectDeliveryScreenState();
}

class _SelectDeliveryScreenState extends State<SelectDeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 96),
        child: WAppBarView(
          title: 'Delivery Address',
        ),
      ),
      body: SizedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: GridView(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              mainAxisExtent: 200,
              crossAxisSpacing: 10,
            ),
            children: List.generate(
              6,
              (index) => WViewAddress(
                name: Address.data[index].name,
                address: Address.data[index].address,
                addDetail: Address.data[index].addDetail,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: WViewBottomNavigationBar(
        buttonTitle: 'Change Address',
        onButtonPressed: () {},
      ),
    );
  }
}
