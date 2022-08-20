import 'package:flutter/material.dart';

import '../../component/const.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({Key? key, required this.size, required this.child})
      : super(key: key);
  final Widget child;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.13,
      height: size.width * 0.13,
      decoration: BoxDecoration(
          color: const Color(mainColor),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [shadow]),
      child: child,
    );
  }
}
