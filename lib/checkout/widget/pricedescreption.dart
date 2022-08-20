import 'package:flutter/material.dart';

class PriceDescreption extends StatelessWidget {
  const PriceDescreption(
      {Key? key,
      required this.descreption,
      required this.amount,
      required this.color,
      required this.fontSize})
      : super(key: key);
  final String descreption;
  final double amount;
  final Color color;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            descreption,
            style: TextStyle(fontSize: fontSize, color: color),
          ),
          Text(
            '\$ ${amount.toStringAsFixed(2)}',
            style: TextStyle(fontSize: fontSize, color: color),
          )
        ],
      ),
    );
  }
}
