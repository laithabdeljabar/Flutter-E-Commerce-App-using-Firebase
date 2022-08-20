import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:l_and_u/authentication/authentication_repository/authentication_repository.dart';

import 'package:l_and_u/shopping_bag/model/order.dart';

class ShoppinBagRepository extends ChangeNotifier {
  final _databaceRef = FirebaseDatabase.instance.ref();
  final _auth = FirebaseAuth.instance;
  List<Order> selectedOrders = [];
  bool selected = false;
  double oldPrice = 0;
  double totalPrice = 0;
  bool haveOldOrders = false;
  bool direction = false;

  AuthenticationRepository authenticationRepository =
      AuthenticationRepository();
  void checkList() {
    selected = false;
    notifyListeners();
  }

  void selectProduct() {
    selected = true;
    notifyListeners();
  }

  addCount(double price, int index) {
    selectedOrders[index].number = selectedOrders[index].number + 1;
    selectedOrders[index].totalPrice = (price) * selectedOrders[index].number;
    totalOrdersPrice(price);

    notifyListeners();
  }

  checkOldOrders() {
    if (authenticationRepository.isLogin()) {
      _databaceRef
          .child('ShoppingBag')
          .child(_auth.currentUser!.uid)
          .get()
          .then((value) {
        if (value.exists) {
          haveOldOrders = true;
          var oldOrders = value.value as Map;
          var myorder = MyOrder.fromJson(oldOrders);
          selectedOrders = myorder.orders;
          totalPrice = myorder.totalPrice;
          // checkoutRepository.calculatePriceWithTax(totalPrice);
        }
      });

      // .catchError((e) {
      //   haveOldOrders = false;
      // });
    } else {
      haveOldOrders = false;
    }
  }

  subCount(double price, int index) {
    if (selectedOrders[index].number > 1) {
      selectedOrders[index].number = selectedOrders[index].number - 1;
      selectedOrders[index].totalPrice = (price) * selectedOrders[index].number;
      totalOrdersPrice(-price);
    } else {
      deleteOrder(index, price);
    }
    notifyListeners();
  }

  void totalOrdersPrice(double price) {
    totalPrice = price + totalPrice;
  }

  void deleteOrder(int index, double price) {
    if (haveOldOrders) {
      selectedOrders.removeAt(index);
      deletMyOrders(index);
      totalOrdersPrice(-price);
      updateMyOrders(MyOrder(totalPrice: totalPrice, orders: selectedOrders));
      if (selectedOrders.isEmpty) {
        _databaceRef
            .child('ShoppingBag')
            .child(_auth.currentUser!.uid)
            .child('totalPrice')
            .remove();
      }
    } else {
      selectedOrders.removeAt(index);
      totalOrdersPrice(-price);
    }

    notifyListeners();
  }

  deletMyOrders(int index) {
    _databaceRef
        .child('ShoppingBag')
        .child(_auth.currentUser!.uid)
        .child('orders')
        .child(index.toString())
        .remove();
  }

  void updateOrder(int index, Order newOrder, bool fromCount) {
    for (int i = 0; i < selectedOrders.length; i++) {
      if (index == i) {
        selectedOrders[i] = newOrder;

        if (haveOldOrders) {
          if (fromCount == false) totalOrdersPrice(newOrder.totalPrice);
          updateMyOrders(
              MyOrder(totalPrice: totalPrice, orders: selectedOrders));
        } else {
          totalOrdersPrice(newOrder.totalPrice);
        }

        return;
      }
    }
    notifyListeners();
  }

  updateMyOrders(MyOrder myOrder) {
    _databaceRef
        .child('ShoppingBag')
        .child(_auth.currentUser!.uid)
        .update(myOrder.toJson());
  }

  fromCount(bool state) {
    direction = state;
    notifyListeners();
  }

  restTotalPrice() {
    totalPrice = 0;
    notifyListeners();
  }
}
