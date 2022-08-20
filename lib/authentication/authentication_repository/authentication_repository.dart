import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:l_and_u/authentication/authentication_repository/user_repository.dart';
import 'package:l_and_u/authentication/model/user.dart';

import '../../component/custom_loder.dart';
import 'auth_exeption.dart';

class AuthenticationRepository extends ChangeNotifier {
  // ignore: unused_field
  final _auth = FirebaseAuth.instance;
  final userRepository = UserRepository();

  late AuthResultStatus status;
  int selectedIndex = 0;

  bool isSecure = true;
  bool successful = false;

  void encryption() {
    isSecure = !isSecure;
    notifyListeners();
  }

  void changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void reset() {
    selectedIndex = 0;
    notifyListeners();
  }

  void signUp(Users user, String password, Function onProsses, Size size) {
    customLoder(size);
    _auth
        .createUserWithEmailAndPassword(
            email: user.email ?? '', password: password)
        .then((value) {
      userRepository.creatNewUser(value.user!.uid, user);
      successful = true;
      onProsses();

      reset();
      EasyLoading.dismiss();
    }).catchError((e) {
      EasyLoading.dismiss();
      status = AuthExceptionHandler.handleException(e);
      successful = false;
      EasyLoading.showError(
        AuthExceptionHandler.generateExceptionMessage(status),
        duration: const Duration(seconds: 2),
      );
    });
  }

  void signIn(String email, String password, Function onProsses, Size size) {
    customLoder(size);
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      onProsses();
      EasyLoading.dismiss();
    }).catchError((e) {
      e.toString();
      EasyLoading.showError("Email or Password is not correct",
          duration: const Duration(seconds: 2));
      notifyListeners();
    });
  }

  User? currentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  String? currentUserId() {
    return FirebaseAuth.instance.currentUser?.uid ?? '';
  }

  void signOut() {
    _auth.signOut();
  }

  void forgetPassword(String email) {
    _auth.sendPasswordResetEmail(email: email);
  }

  bool isLogin() {
    return _auth.currentUser != null;
  }
}
