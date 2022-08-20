import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';

customLoder(Size size) {
  EasyLoading.show(
      status: 'Loading...',
      indicator:
          Lottie.asset('assets/lf20_h2d0cota.json', width: size.width * 0.4));
}
