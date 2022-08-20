import 'package:flutter/material.dart';

import 'package:l_and_u/product/model/product.dart';

class ProductColorsList extends StatelessWidget {
  final Proudct proudct;
  final double height;
  final double width;
  const ProductColorsList(
      {Key? key,
      required this.proudct,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 4),
        height: height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: proudct.rgbColors!.length,
          itemBuilder: (context, ind) {
            return Container(
                margin: const EdgeInsets.only(right: 5),
                width: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(int.parse('0xff${proudct.rgbColors![ind]}')),
                ));
          },
        ));
  }
}
