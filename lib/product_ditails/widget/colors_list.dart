import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../component/const.dart';
import '../../product/model/product.dart';

import '../product_ditails_repository/product_ditails_repository.dart';

class ColorsList extends StatelessWidget {
  const ColorsList({Key? key, required this.proudct, required this.colorIndex})
      : super(key: key);

  final Proudct proudct;
  final int colorIndex;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: proudct.rgbColors!.length,
      itemBuilder: (context, ind) {
        return Consumer<ProductDitailsRepository>(
          builder: (context, value, child) {
            return InkWell(
              onTap: () {
                value.selectColor(value.edit ? colorIndex : ind);
              },
              child: Center(
                  child: value.selecedColor == ind
                      ? CircleAvatar(
                          backgroundColor: Color(
                              int.parse('0xff${proudct.rgbColors![ind]}')),
                          child: Container(
                              padding: const EdgeInsets.all(4),
                              margin: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                color: Color(mainColor),
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                child: SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: Container(
                                        decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(int.parse(
                                          '0xff${proudct.rgbColors![ind]}')),
                                    ))),
                              )))
                      : ClipOval(
                          child: SizedBox(
                              height: 20,
                              width: 20,
                              child: Container(
                                  margin: const EdgeInsets.only(right: 6),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(int.parse(
                                        '0xff${proudct.rgbColors![ind]}')),
                                  ))),
                        )),
            );
          },
        );
      },
    );
  }
}
