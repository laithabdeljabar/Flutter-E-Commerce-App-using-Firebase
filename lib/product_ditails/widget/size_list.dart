import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../product/model/product.dart';
import '../product_ditails_repository/product_ditails_repository.dart';

class SizeList extends StatelessWidget {
  const SizeList({Key? key, required this.proudct, required this.sizeIndex})
      : super(key: key);

  final Proudct proudct;
  final int sizeIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: proudct.variantSizes!.length,
      itemBuilder: (context, ind) {
        return Consumer<ProductDitailsRepository>(
          builder: (context, value, child) {
            return InkWell(
              onTap: () {
                value.selectSize(value.edit ? sizeIndex : ind);
              },
              child: Container(
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: value.selectedSize == ind
                          ? Colors.grey
                          : Colors.transparent),
                  margin: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: Center(
                      child: Text(
                    proudct.variantSizes![ind].filterCode ?? '',
                    style: TextStyle(
                        color: value.selectedSize == ind
                            ? Colors.white
                            : Colors.black),
                  ))),
            );
          },
        );
      },
    );
  }
}
