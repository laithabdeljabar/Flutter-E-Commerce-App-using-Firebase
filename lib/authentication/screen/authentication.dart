import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:l_and_u/authentication/authentication_repository/authentication_repository.dart';

import 'package:l_and_u/authentication/model/auth.dart';

import 'package:l_and_u/authentication/screen/login.dart';
import 'package:l_and_u/authentication/widget/auth_container.dart';
import 'package:l_and_u/authentication/screen/signup.dart';

import 'package:l_and_u/component/const.dart';
import 'package:l_and_u/product/widget/addpar_container.dart';

import '../widget/authentication_list.dart';

// ignore: must_be_immutable
class Authentication extends StatelessWidget {
  Authentication({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController logiEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(fontColor),
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: size.height * 0.15,
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.04,
                    ),
                    child: const Text(
                      'L&U',
                      style: TextStyle(
                          color: Color(mainColor),
                          fontFamily: 'Valentina',
                          fontWeight: FontWeight.w100,
                          fontSize: 35),
                    ),
                  ),
                  Expanded(
                    child:
                        AuthCintainer(child: Consumer<AuthenticationRepository>(
                      builder: (context, value, child) {
                        return Column(
                          children: [
                            const Align(
                              alignment: Alignment.center,
                              child: AuthenticationList(),
                            ),
                            if (Auth.login.index == value.selectedIndex)
                              Login(
                                emailController: logiEmailController,
                                passwordController: loginPasswordController,
                              ),
                            if (Auth.singup.index == value.selectedIndex)
                              SignUp(
                                emailController: signUpEmailController,
                                passwordController: signUpPasswordController,
                                phoneController: phoneController,
                                nameController: nameController,
                              )
                          ],
                        );
                      },
                    )),
                  )
                ],
              ),
              Positioned(
                  top: 15,
                  left: 10,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: AppBarContainer(
                        size: size,
                        child: const Icon(Icons.arrow_back_ios_new)),
                  ))
            ],
          )),
    );
  }
}
