import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:l_and_u/authentication/authentication_repository/authentication_repository.dart';
import 'package:l_and_u/authentication/authentication_repository/user_repository.dart';
import 'package:l_and_u/component/const.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Provider.of<UserRepository>(context, listen: false).getUserDitails(size);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'L&U',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Valentina',
                  fontWeight: FontWeight.w100,
                  fontSize: 27),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
            backgroundColor: const Color(fontColor),
          ),
          backgroundColor: const Color(backgroundColor),
          body: Consumer<UserRepository>(
            builder: (context, value, child) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UserDetailsContainer(
                      fontSize: 20,
                      size: size,
                      text: value.userProfile.name ?? '-',
                      icon: Icons.person,
                    ),
                    UserDetailsContainer(
                      fontSize: 20,
                      size: size,
                      text: value.userProfile.email ?? '-',
                      icon: Icons.email,
                    ),
                    UserDetailsContainer(
                      fontSize: 20,
                      size: size,
                      text: value.userProfile.phone ?? '-',
                      icon: Icons.phone,
                    ),
                    UserDetailsContainer(
                      size: size,
                      text: value.userProfile.address?.addressName ?? '-',
                      icon: Icons.home,
                      fontSize: 15,
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(fontColor)),
                        ),
                        onPressed: () {
                          Provider.of<AuthenticationRepository>(context,
                                  listen: false)
                              .signOut();
                          Navigator.pop(context);
                        },
                        child: const Text('Log out'))
                  ],
                ),
              );
            },
          )),
    );
  }
}

class UserDetailsContainer extends StatelessWidget {
  const UserDetailsContainer(
      {Key? key,
      required this.fontSize,
      required this.size,
      required this.icon,
      required this.text})
      : super(key: key);

  final Size size;
  final String text;
  final IconData icon;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * 0.07,
        decoration: BoxDecoration(
            boxShadow: [shadow],
            color: const Color(mainColor),
            borderRadius:
                BorderRadius.only(topLeft: radius, bottomRight: radius)),
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: const Color(fontColor),
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            Text(
              text,
              style: TextStyle(fontSize: fontSize),
            ),
          ],
        ));
  }
}
