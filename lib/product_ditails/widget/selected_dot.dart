import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:l_and_u/component/const.dart';
import 'package:l_and_u/product_ditails/product_ditails_repository/product_ditails_repository.dart';

class SelectedDot extends StatelessWidget {
  const SelectedDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Consumer<ProductDitailsRepository>(builder: (context, value, child) {
      return SizedBox(
        height: 6,
        width: 45,
        child: ListView.builder(
            itemCount: 2,
            scrollDirection: Axis.horizontal,
            itemBuilder: (contex, index) {
              return Container(
                width: value.selectedIndex == index ? 15 : 8,
                margin: const EdgeInsets.only(right: 4),
                height: 6,
                decoration: BoxDecoration(
                    color: value.selectedIndex == index
                        ? const Color(fontColor)
                        : Colors.black26,
                    borderRadius: BorderRadius.circular(3)),
              );
            }),
      );
    });
  }
}
