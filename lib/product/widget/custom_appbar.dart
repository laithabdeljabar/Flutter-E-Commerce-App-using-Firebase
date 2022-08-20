import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget leading;
  final Widget action;
  const CustomAppBar({Key? key, required this.leading, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.02,
        vertical: size.width * 0.01,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading,
          const Text(
            'L&U',
            style: TextStyle(
                fontFamily: 'Valentina',
                fontWeight: FontWeight.w100,
                fontSize: 27),
          ),
          action
        ],
      ),
    );
  }
}
