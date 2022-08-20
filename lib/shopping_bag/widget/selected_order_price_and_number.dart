import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/order.dart';
import '../repository/shopping_bag_repository.dart';

class SelectedOrderPriceAndNumber extends StatelessWidget {
  const SelectedOrderPriceAndNumber(
      {Key? key, required this.size, required this.order, required this.index})
      : super(key: key);

  final Size size;
  final Order order;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppinBagRepository>(
      builder: (context, repository, child) {
        return Column(
          children: [
            Text(
              '\$${order.totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 19),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                width: size.width * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        repository.addCount(order.price, index);
                        if (repository.haveOldOrders) {
                          repository.updateOrder(index, order, true);
                        }
                      },
                      child: const Icon(
                        Icons.add,
                        size: 15,
                      ),
                    ),
                    Text(order.number.round().toString()),
                    InkWell(
                      onTap: () {
                        repository.subCount(order.price, index);
                        if (repository.haveOldOrders) {
                          repository.updateOrder(index, order, true);
                        }
                        //   repository.updateOrder(index, order);
                      },
                      child: const Icon(
                        Icons.remove,
                        size: 15,
                      ),
                    ),
                  ],
                ))
          ],
        );
      },
    );
  }
}
