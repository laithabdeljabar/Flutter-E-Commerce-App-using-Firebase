import 'package:flutter/cupertino.dart';

import 'package:l_and_u/component/const.dart';

class BottomButton extends StatelessWidget {
  final Widget child;
  final int color;

  final double topPadding;
  const BottomButton(
      {Key? key,
      required this.child,
      required this.color,
      required this.topPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
          left: size.width * 0.1,
          right: size.width * 0.1,
          bottom: 15,
          top: topPadding),
      height: size.height * 0.08,
      decoration: BoxDecoration(
          color: Color(color),
          boxShadow: [
            BoxShadow(
                offset: const Offset(4, 6),
                color: const Color(0xff3C38F0).withAlpha(8))
          ],
          borderRadius:
              BorderRadius.only(bottomLeft: radius, topRight: radius)),
      child: Center(child: child),
    );
  }
}
