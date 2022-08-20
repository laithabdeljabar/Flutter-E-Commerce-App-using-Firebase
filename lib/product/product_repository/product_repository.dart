import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:l_and_u/product/model/product.dart';

class ProductRepository extends ChangeNotifier {
  List<Proudct> products = [];
  bool movDown = false;
  void openCloseDrawe() {
    movDown = !movDown;
    notifyListeners();
  }

  final _databaceRef = FirebaseDatabase.instance.ref();
  void data() {
    _databaceRef.child('product').once().then((value) {
      var data = value.snapshot.value as List<dynamic>;
      products = data
          .map(
            (e) => Proudct.fromJson(e as Map),
          )
          .toList();

      notifyListeners();
    });
  }

  searchproduct(String quary) {
    final suggest = products.where((element) {
      final proudectName = element.name ?? ''.toLowerCase();
      final input = quary.toLowerCase();
      return proudectName.contains(input);
    }).toList();
    products = suggest;
    notifyListeners();
  }
}
