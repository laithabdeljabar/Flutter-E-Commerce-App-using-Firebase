import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:l_and_u/authentication/authentication_repository/authentication_repository.dart';
import 'package:l_and_u/component/const.dart';

// ignore: must_be_immutable
class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType textInputType;
  final IconData icon;
  Widget? suffixIcon;
  final bool forPaswword;

  String? Function(String?)? validator;
  AuthTextField(
      {Key? key,
      required this.controller,
      required this.forPaswword,
      this.validator,
      this.suffixIcon,
      required this.icon,
      required this.hint,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.08, vertical: size.height * 0.02),
      child: TextFormField(
        obscureText: forPaswword
            ? Provider.of<AuthenticationRepository>(context, listen: false)
                    .isSecure
                ? true
                : false
            : false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        keyboardType: textInputType,
        controller: controller,
        style: const TextStyle(color: Color(fontColor)),
        decoration: InputDecoration(
            icon: Icon(icon, color: const Color(fontColor)),
            filled: true,
            border: InputBorder.none,
            hintText: hint,
            suffixIcon: suffixIcon),
      ),
    );
  }
}
