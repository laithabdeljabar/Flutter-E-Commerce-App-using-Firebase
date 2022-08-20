import 'package:flutter/material.dart';

import '../../component/const.dart';

class EmptyShoppingBag extends StatelessWidget {
  const EmptyShoppingBag({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.2),
      child: Column(
        children: [
          Image.asset(
            'assets/images/shopping-bag (2).png',
            width: size.width * 0.5,
            color: const Color(fontColor),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.02,
            ),
            child: const Text(
              'Your bag is empty',
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}
