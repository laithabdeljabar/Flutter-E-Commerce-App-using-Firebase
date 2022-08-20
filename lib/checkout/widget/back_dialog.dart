import 'package:flutter/material.dart';

import '../../component/const.dart';

Future<bool?> backDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: const Color(fontColor),
            title: const Text(
              'L&U',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Valentina',
                fontWeight: FontWeight.w100,
                color: Color(mainColor),
                fontSize: 27,
              ),
            ),
            actions: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Are you sure to leave this page?',
                  style: TextStyle(color: Color(mainColor), fontSize: 17),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text(
                        'No',
                        style: TextStyle(color: Color(mainColor), fontSize: 20),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: Color(mainColor), fontSize: 20),
                      ))
                ],
              )
            ],
          ));
}
