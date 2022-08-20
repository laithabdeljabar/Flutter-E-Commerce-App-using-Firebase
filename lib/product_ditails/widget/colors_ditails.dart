import 'package:flutter/material.dart';
import 'package:l_and_u/product_ditails/widget/colors_list.dart';

import '../../product/model/product.dart';

class ColorsDitails extends StatelessWidget {
  const ColorsDitails(
      {Key? key, required this.proudct, required this.colorIndex})
      : super(key: key);

  final Proudct proudct;
  final int colorIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Text(
            'Color',
            style: TextStyle(color: Colors.black45),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, bottom: 5),
          height: 30,
          child: ColorsList(
            proudct: proudct,
            colorIndex: colorIndex,
          ),
        ),
      ],
    );
  }
}
