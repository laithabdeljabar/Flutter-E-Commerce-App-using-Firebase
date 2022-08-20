import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../component/const.dart';
import '../authentication_repository/authentication_repository.dart';
import '../model/auth.dart';

class AuthenticationList extends StatelessWidget {
  const AuthenticationList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 130,
      child: ListView.builder(
        itemCount: authMenu.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Consumer<AuthenticationRepository>(
            builder: (context, value, child) {
              return InkWell(
                onTap: () {
                  value.changeIndex(index);
                },
                child: Container(
                  padding: EdgeInsets.only(right: index == 0 ? 10 : 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          authMenu.elementAt(index),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: value.selectedIndex == index
                              ? const Color(fontColor)
                              : Colors.transparent,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
