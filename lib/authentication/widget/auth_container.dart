import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:l_and_u/component/animation/fade_animation.dart';
import 'package:l_and_u/component/const.dart';

class AuthCintainer extends StatelessWidget {
  final Widget child;
  const AuthCintainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: radius,
          ),
          boxShadow: [shadow],
          color: const Color(mainColor)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FadeAnimation(
                delay: 1,
                child: Lottie.asset('assets/lf30_editor_sdg75swn.json')),
            FadeAnimation(delay: 1.5, child: child),
          ],
        ),
      ),
    );
  }
}
