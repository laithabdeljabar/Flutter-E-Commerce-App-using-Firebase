import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:l_and_u/product/model/product.dart';

import '../../component/const.dart';
import '../product_ditails_repository/product_ditails_repository.dart';

class Counter extends StatelessWidget {
  final Proudct product;
  const Counter(
      {Key? key,
      required this.size,
      required this.product,
      required this.newCount})
      : super(key: key);

  final Size size;
  final double newCount;

  @override
  Widget build(BuildContext context) {
    var rep = Provider.of<ProductDitailsRepository>(context, listen: false);

    return Container(
      width: size.width * 0.12,
      height: size.height * 0.17,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: radius, bottomRight: radius),
          color: const Color(mainColor),
          boxShadow: [shadow]),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  rep.addCount(
                    product.price!.value ?? -1,
                  );
                },
                icon: const Icon(
                  Icons.add,
                  size: 17,
                )),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: const Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(child: Text(rep.count.round().toString())),
            ),
            IconButton(
                onPressed: () {
                  rep.subCount(
                    product.price!.value ?? -1,
                  );
                },
                icon: const Icon(
                  Icons.remove,
                  size: 17,
                ))
          ],
        ),
      ),
    );
  }
}
