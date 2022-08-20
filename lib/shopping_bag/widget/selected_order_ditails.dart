import 'package:flutter/material.dart';

import '../model/order.dart';

class SelectedOrderDitails extends StatelessWidget {
  const SelectedOrderDitails({
    Key? key,
    required this.size,
    required this.order,
  }) : super(key: key);

  final Size size;
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      width: size.width * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(order.orderName, overflow: TextOverflow.ellipsis),
          Row(
            children: [
              const Text(
                'Size: ',
                style: TextStyle(color: Colors.black38),
              ),
              Text(order.orderSize),
            ],
          ),
          Row(
            children: [
              const Text('Color: ', style: TextStyle(color: Colors.black38)),
              Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(int.parse('0xff${order.colorNumber}')),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
