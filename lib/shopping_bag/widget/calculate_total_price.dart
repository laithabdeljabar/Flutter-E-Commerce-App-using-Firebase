import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../component/const.dart';
import '../repository/shopping_bag_repository.dart';

class CalculateTotalPrice extends StatelessWidget {
  const CalculateTotalPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppinBagRepository>(
      builder: (context, value, child) {
        return ListTile(
          leading: const Text(
            'Total',
            style: TextStyle(color: Color(mainColor), fontSize: 25),
          ),
          trailing: Text(
            '\$${value.totalPrice.toStringAsFixed(2)}',
            style: const TextStyle(color: Color(mainColor), fontSize: 25),
          ),
        );
      },
    );
  }
}
