import 'package:flutter/material.dart';

import 'package:l_and_u/component/const.dart';
import 'package:l_and_u/shopping_bag/model/order.dart';

class OrderList extends StatelessWidget {
  final MyOrder myOrder;
  const OrderList({Key? key, required this.myOrder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(fontColor),
      ),
      body: ListView.builder(
        itemCount: myOrder.orders.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(right: 7),
            margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
            decoration: BoxDecoration(
              boxShadow: [shadow],
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    FadeInImage.assetNetwork(
                      placeholder:
                          'assets/images/placeholder-image-300x225.png',
                      image: myOrder.orders[index].images,
                      width: size.width * 0.15,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          myOrder.orders[index].orderName,
                        ),
                        Text(
                          'Amount : ${myOrder.orders[index].number.round()}',
                          style: const TextStyle(color: Colors.black38),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  '\$${myOrder.orders[index].totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
