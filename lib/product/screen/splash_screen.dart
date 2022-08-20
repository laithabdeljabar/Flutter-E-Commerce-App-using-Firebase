import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:l_and_u/product/screen/home.dart';

import '../../component/const.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AnimatedSplashScreen(
        duration: 1500,
        splashIconSize: size.height * 0.5,
        backgroundColor: const Color(backgroundColor),
        splashTransition: SplashTransition.sizeTransition,
        splash: Container(
          alignment: Alignment.center,
          child: const Text(
            'L&U',
            style: TextStyle(
                fontFamily: 'Valentina',
                fontWeight: FontWeight.w100,
                fontSize: 45),
          ),
        ),
        nextScreen: Home());
  }
}
