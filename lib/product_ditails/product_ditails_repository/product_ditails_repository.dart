import 'package:flutter/material.dart';

class ProductDitailsRepository extends ChangeNotifier {
  double count = 1;
  int selecedColor = 0;
  int selectedSize = 0;
  double price = -1;
  int selectedIndex = 0;
  bool edit = false;
  bool toEdit = false;
  void editProdect() {
    edit = true;
    toEdit = true;
    notifyListeners();
  }

  void startEdit(int colorIndex, int sizeIndex) {
    edit = false;
    selecedColor = colorIndex;
    selectedSize = sizeIndex;
  }

  void endEdit() {
    edit = false;
    toEdit = false;
    selecedColor = 0;
    selectedSize = 0;
    count = 1;
  }

  intiialPrice(double intPrice) {
    price = intPrice;
  }

  void changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void restCounter(double newCount) {
    count = newCount;
  }

  addCount(
    double value,
  ) {
    count = count + 1;

    price = (value * count);
    notifyListeners();
  }

  subCount(
    double value,
  ) {
    if (count > 1) {
      count = count - 1;
    } else {
      count = 1;
    }

    price = value * count;
    notifyListeners();
  }

  void selectColor(int index) {
    selecedColor = index;
    notifyListeners();
  }

  void selectSize(int index) {
    selectedSize = index;
    notifyListeners();
  }

  // void counter(double value) {
  //   price = value * count;
  // }
}
