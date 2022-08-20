import 'package:flutter/material.dart';

import 'package:l_and_u/checkout/widget/price_details.dart';

import '../widget/descreption.dart';

import '../widget/location_container.dart';

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      margin: EdgeInsets.only(top: size.height * 0.15),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Descreption(size: size, descreption: 'Address'),
            LocationContainer(
                margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.04),
                size: size,
                borderRadius: BorderRadius.circular(15)),
            Descreption(size: size, descreption: 'Price details'),
            PriceDetails(size: size)
          ]),
    );
  }
}
