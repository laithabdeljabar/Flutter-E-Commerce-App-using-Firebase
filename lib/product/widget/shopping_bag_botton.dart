import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../component/const.dart';
import '../../shopping_bag/repository/shopping_bag_repository.dart';

class ShoppingBagBottun extends StatelessWidget {
  const ShoppingBagBottun({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<ShoppinBagRepository>(
        builder: (context, value, child) {
          return Stack(
            children: [
              Image.asset(
                'assets/images/shopping-bag.png',
                width: 20,
                color: const Color(fontColor),
              ),
              value.selected
                  ? Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.redAccent),
                        width: 12,
                        height: 12,
                        child: Center(
                            child: Text(
                          value.selectedOrders.length.toString(),
                          style:
                              const TextStyle(color: Colors.white, fontSize: 7),
                        )),
                      ),
                    )
                  : const SizedBox()
            ],
          );
        },
      ),
    );
  }
}
