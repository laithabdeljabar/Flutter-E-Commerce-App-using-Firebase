import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:l_and_u/authentication/authentication_repository/authentication_repository.dart';
import 'package:l_and_u/authentication/widget/auth_textfield.dart';
import 'package:l_and_u/authentication/widget/forgetpassword.dart';

import '../../component/const.dart';
import '../../product_ditails/widget/bottom_button.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  const Login(
      {Key? key,
      required this.emailController,
      required this.passwordController})
      : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    TextEditingController forgetPasswordController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        AuthTextField(
          forPaswword: false,
          textInputType: TextInputType.emailAddress,
          controller: emailController,
          hint: 'Email',
          icon: Icons.email,
        ),
        AuthTextField(
            forPaswword: true,
            textInputType: TextInputType.text,
            controller: passwordController,
            hint: 'Password',
            icon: Icons.password,
            suffixIcon: IconButton(
              onPressed: () {
                Provider.of<AuthenticationRepository>(context, listen: false)
                    .encryption();
              },
              icon: Image.asset(
                'assets/images/eye.png',
                width: 27,
                color: const Color(fontColor),
              ),
            )),
        InkWell(
          onTap: () {
            Provider.of<AuthenticationRepository>(context, listen: false)
                .signIn(emailController.text, passwordController.text, () {
              Navigator.pop(context);
              emailController.clear();
              passwordController.clear();
            }, size);
          },
          child: BottomButton(
              color: fontColor,
              topPadding: size.height * 0.03,
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 18, color: Color(mainColor)),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: InkWell(
              onTap: () {
                forgetPassword(context, forgetPasswordController);
              },
              child: const Text('forget Password ?')),
        )
      ],
    );
  }
}
