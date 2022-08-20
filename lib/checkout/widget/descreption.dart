import 'package:flutter/material.dart';

class Descreption extends StatelessWidget {
  const Descreption({Key? key, required this.size, required this.descreption})
      : super(key: key);

  final Size size;
  final String descreption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: size.height * 0.01, bottom: size.height * 0.01, left: 20),
      child: Text(
        descreption,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
