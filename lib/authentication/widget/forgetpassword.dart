import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:provider/provider.dart';
import 'package:l_and_u/component/const.dart';

import '../authentication_repository/authentication_repository.dart';
import 'auth_textfield.dart';

void forgetPassword(
    BuildContext context, TextEditingController emailController) {
  // ignore: unused_local_variable
  final formKey = GlobalKey<FormState>();
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Forget Password'),
            actions: [
              AuthTextField(
                forPaswword: false,
                textInputType: TextInputType.emailAddress,
                controller: emailController,
                hint: 'Email',
                icon: Icons.email,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(fontColor)),
                  ),
                  onPressed: () {
                    if (emailController.text.isNotEmpty &&
                        EmailValidator.validate(emailController.text)) {
                      Provider.of<AuthenticationRepository>(context,
                              listen: false)
                          .forgetPassword(emailController.text);
                      Navigator.pop(context);
                      emailController.clear();
                    } else {
                      EasyLoading.showError("Enter a valid Email",
                          duration: const Duration(seconds: 2));
                    }
                  },
                  child: const Text('Send Email'))
            ],
          ));
}
