import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:l_and_u/checkout/checkout_repository/checkout_repository.dart';
import 'package:l_and_u/checkout/widget/pricedescreption.dart';

import '../../component/const.dart';
import '../../shopping_bag/repository/shopping_bag_repository.dart';

class PriceDetails extends StatelessWidget {
  const PriceDetails({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.height * 0.04),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(mainColor),
          boxShadow: [shadow]),
      child: Column(
        children: [
          PriceDescreption(
            descreption: 'Items',
            amount: Provider.of<ShoppinBagRepository>(context, listen: false)
                .totalPrice,
            color: Colors.black38,
            fontSize: 18,
          ),
          const PriceDescreption(
            descreption: 'Delivery',
            amount: 0,
            color: Colors.black38,
            fontSize: 18,
          ),
          const PriceDescreption(
            descreption: 'Tax',
            amount: 3,
            color: Colors.black38,
            fontSize: 18,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: DottedLine(),
          ),
          const SizedBox(
            height: 5,
          ),
          PriceDescreption(
            descreption: 'Total Price',
            amount: Provider.of<CheckoutRepository>(context, listen: false)
                .priceWithTax,
            color: const Color(fontColor),
            fontSize: 25,
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
