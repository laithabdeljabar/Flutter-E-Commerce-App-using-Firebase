import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../component/custom_loder.dart';
import '../model/user.dart';

class UserRepository extends ChangeNotifier {
  final _databaceRef = FirebaseDatabase.instance.ref();
  final _auth = FirebaseAuth.instance;
  Users user = Users(
    name: '',
    email: '',
    id: '',
    phone: '',
  );
  Users userProfile = Users(
    name: '',
    email: '',
    id: '',
    phone: '',
  );
  void creatNewUser(String id, Users user) {
    _databaceRef.child('User').child(id).set(user.toJson());
  }

  getUserDitails(Size size) {
    customLoder(size);
    _databaceRef
        .child('User')
        .child(_auth.currentUser!.uid)
        .get()
        .then((value) {
      if (value.exists) {
        var data = value.value as Map;
        userProfile = Users.fromJson(data);
        notifyListeners();
        EasyLoading.dismiss();
      } else {
        EasyLoading.showError('No data available', dismissOnTap: true);
      }
    });
  }
}
