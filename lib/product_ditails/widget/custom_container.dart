import 'package:flutter/material.dart';

import '../../component/const.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double width;
  const CustomContainer(
      {Key? key, required this.size, required this.child, required this.width})
      : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.09,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(mainColor),
          boxShadow: [shadow]),
      child: Center(child: child),
    );
  }
}
