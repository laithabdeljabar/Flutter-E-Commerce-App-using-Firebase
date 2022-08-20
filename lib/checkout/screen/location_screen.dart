import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:l_and_u/checkout/checkout_repository/checkout_repository.dart';

import 'package:l_and_u/component/const.dart';

import '../../product_ditails/widget/bottom_button.dart';
import '../widget/location_container.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    Provider.of<CheckoutRepository>(context, listen: false).checkAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        height: size.height,
        margin: EdgeInsets.only(top: size.height * 0.2),
        color: const Color(backgroundColor),
        child: InkWell(onTap: () {
          Provider.of<CheckoutRepository>(context, listen: false)
              .goToMapMethod(true);
        }, child: Consumer<CheckoutRepository>(
          builder: (context, value, child) {
            return Column(
              children: [
                LocationContainer(
                    margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: size.height * 0.1),
                    size: size,
                    borderRadius: BorderRadius.only(
                        bottomRight: radius, topLeft: radius)),
                const BottomButton(
                  color: fontColor,
                  topPadding: 0,
                  child: Text(
                    'Add Location',
                    style: TextStyle(color: Color(mainColor), fontSize: 17),
                  ),
                ),
              ],
            );
          },
        )));
  }
}
