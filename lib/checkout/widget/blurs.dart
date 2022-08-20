import 'dart:ui';

import 'package:flutter/material.dart';

class Blurs extends StatelessWidget {
  final Size size;
  final Widget child;
  final double width;
  final double height;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  Blurs(
    this.size,
    this.child,
    this.width,
    this.height,
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.3),
          ),
          child: child,
        ),
      ),
    );
  }
}
