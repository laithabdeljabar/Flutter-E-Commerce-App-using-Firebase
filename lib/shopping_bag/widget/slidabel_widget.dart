import 'package:flutter/material.dart';

import '../../component/const.dart';

class SlideableWidget extends StatelessWidget {
  const SlideableWidget({
    Key? key,
    required this.size,
    required this.slidAbleIcon,
  }) : super(key: key);

  final Size size;
  final String slidAbleIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: size.height * 0.02,
        bottom: size.height * 0.02,
        right: size.width * 0.05,
      ),
      height: size.height * 0.2,
      width: size.width * 0.15,
      decoration: BoxDecoration(
          boxShadow: [shadow],
          color: const Color(mainColor),
          borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Image.asset(
          slidAbleIcon,
          color: const Color(fontColor),
          width: 25,
        ),
      ),
    );
  }
}
