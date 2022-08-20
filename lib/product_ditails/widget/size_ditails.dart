import 'package:flutter/material.dart';

import 'package:l_and_u/product/model/product.dart';
import 'package:l_and_u/product_ditails/widget/size_list.dart';

class SizeDitails extends StatelessWidget {
  const SizeDitails({Key? key, required this.proudct, required this.sizeIndex})
      : super(key: key);
  final Proudct proudct;
  final int sizeIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Text(
            'Size',
            style: TextStyle(color: Colors.black45),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, bottom: 5),
          height: 30,
          child: SizeList(
            sizeIndex: sizeIndex,
            proudct: proudct,
          ),
        ),
      ],
    );
  }
}
