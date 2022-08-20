import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:l_and_u/authentication/authentication_repository/authentication_repository.dart';

import 'package:l_and_u/authentication/model/user.dart';

import 'package:l_and_u/component/const.dart';
import 'package:l_and_u/product_ditails/widget/bottom_button.dart';

import '../widget/auth_textfield.dart';

// ignore: must_be_immutable
class SignUp extends StatefulWidget {
  const SignUp(
      {Key? key,
      required this.emailController,
      required this.nameController,
      required this.phoneController,
      required this.passwordController})
      : super(key: key);
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var authRepository =
        Provider.of<AuthenticationRepository>(context, listen: false);
    String? id = authRepository.currentUserId();

    return Form(
      key: formKey,
      child: Column(
        children: [
          AuthTextField(
            forPaswword: false,
            validator: (name) {
              if (name == null || name.isEmpty) {
                return 'Enter your name';
              } else {
                return null;
              }
            },
            textInputType: TextInputType.text,
            controller: widget.nameController,
            hint: 'Name',
            icon: Icons.person,
          ),
          AuthTextField(
            forPaswword: false,
            textInputType: TextInputType.emailAddress,
            controller: widget.emailController,
            hint: 'Email',
            icon: Icons.email,
            validator: (email) {
              if (email != null && !EmailValidator.validate(email)) {
                return 'Enter a valid Email';
              } else {
                return null;
              }
            },
          ),
          AuthTextField(
            forPaswword: false,
            textInputType: TextInputType.number,
            controller: widget.phoneController,
            hint: 'Phone Number',
            icon: Icons.phone,
            validator: (phone) {
              if (phone == null || phone.isEmpty) {
                return 'Enter a valid phone number';
              } else {
                return null;
              }
            },
          ),
          AuthTextField(
            forPaswword: true,
            textInputType: TextInputType.text,
            controller: widget.passwordController,
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
            ),
            validator: (password) {
              if (password == null || password.isEmpty) {
                return 'Enter a valid password';
              } else if (password.length < 6) {
                return 'Must be at least 6 characters long';
              } else {
                return null;
              }
            },
          ),
          InkWell(
            onTap: () {
              final form = formKey.currentState!;
              if (form.validate()) {
                Provider.of<AuthenticationRepository>(context, listen: false)
                    .signUp(
                        Users(
                            id: id,
                            name: widget.nameController.text,
                            email: widget.emailController.text,
                            phone: widget.phoneController.text),
                        widget.passwordController.text, () {
                  Navigator.pop(context);
                  widget.emailController.clear();
                  widget.passwordController.clear();
                  widget.nameController.clear();
                  widget.phoneController.clear();
                }, size);
              }
            },
            child: BottomButton(
                color: fontColor,
                topPadding: size.height * 0.03,
                child: const Text(
                  'SignUp',
                  style: TextStyle(fontSize: 18, color: Color(mainColor)),
                )),
          )
        ],
      ),
    );
  }
}
