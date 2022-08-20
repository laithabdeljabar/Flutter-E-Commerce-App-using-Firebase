import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../authentication/authentication_repository/authentication_repository.dart';
import '../../authentication/screen/authentication.dart';
import '../../component/const.dart';
import '../../user_profile/screen/profile.dart';
import '../product_repository/product_repository.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ProductRepository>(
      builder: (context, value, child) {
        return AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            top: value.movDown ? 0 : -size.height,
            // bottom: 0,
            left: 0,
            right: 0,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: value.movDown ? 10 : 0,
                  sigmaY: value.movDown ? 10 : 0),
              child: Container(
                height: size.height,
                color: const Color(fontColor).withOpacity(0.5),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        value.openCloseDrawe();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Color(mainColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.15),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Provider.of<AuthenticationRepository>(context,
                                          listen: false)
                                      .isLogin()
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Profile()))
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Authentication()));
                            },
                            child: const ListTile(
                              leading: Icon(
                                Icons.person,
                                size: 30,
                                color: Color(mainColor),
                              ),
                              title: Text(
                                'Your Account',
                                style: TextStyle(
                                    color: Color(mainColor), fontSize: 17),
                              ),
                            ),
                          ),
                          const ListTile(
                            leading: Icon(
                              Icons.settings,
                              size: 30,
                              color: Color(mainColor),
                            ),
                            title: Text(
                              'Settings',
                              style: TextStyle(
                                  color: Color(mainColor), fontSize: 17),
                            ),
                          ),
                          const ListTile(
                            leading: Icon(
                              Icons.phone,
                              size: 30,
                              color: Color(mainColor),
                            ),
                            title: Text(
                              'Customer Service',
                              style: TextStyle(
                                  color: Color(mainColor), fontSize: 17),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Provider.of<AuthenticationRepository>(context,
                                          listen: false)
                                      .isLogin()
                                  ? Provider.of<AuthenticationRepository>(
                                          context,
                                          listen: false)
                                      .signOut()
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Authentication()));
                            },
                            child: ListTile(
                              leading: Icon(
                                Provider.of<AuthenticationRepository>(context,
                                            listen: false)
                                        .isLogin()
                                    ? Icons.logout
                                    : Icons.login,
                                size: 30,
                                color: const Color(mainColor),
                              ),
                              title: Text(
                                Provider.of<AuthenticationRepository>(context,
                                            listen: false)
                                        .isLogin()
                                    ? 'LogOut'
                                    : 'Login',
                                style: const TextStyle(
                                    color: Color(mainColor), fontSize: 17),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
