import 'package:flutter/material.dart';
import 'package:l_and_u/shopping_bag/widget/selected_order_ditails.dart';
import 'package:l_and_u/shopping_bag/widget/selected_order_image.dart';
import 'package:l_and_u/shopping_bag/widget/selected_order_price_and_number.dart';

import '../../component/const.dart';
import '../model/order.dart';

class SelectedeOrder extends StatelessWidget {
  const SelectedeOrder(
      {Key? key, required this.size, required this.order, required this.index})
      : super(key: key);

  final Size size;
  final Order order;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: index == 0 ? size.height * 0.02 : 0,
          left: size.width * 0.05,
          right: size.width * 0.05,
          bottom: size.height * 0.02),
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: const Color(mainColor),
          borderRadius: BorderRadius.circular(12)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SelectedOrderImage(order: order, size: size),
        SelectedOrderDitails(
          size: size,
          order: order,
        ),
        SelectedOrderPriceAndNumber(
          size: size,
          order: order,
          index: index,
        )
      ]),
    );
  }
}
