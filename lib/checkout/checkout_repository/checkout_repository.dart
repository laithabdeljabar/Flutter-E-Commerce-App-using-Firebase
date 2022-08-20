import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:l_and_u/shopping_bag/model/order.dart';
import 'package:l_and_u/shopping_bag/repository/shopping_bag_repository.dart';

import '../../authentication/model/user.dart';

class CheckoutRepository extends ChangeNotifier {
  final _databaceRef = FirebaseDatabase.instance.ref();
  ShoppinBagRepository shoppinBagRepository = ShoppinBagRepository();
  final _auth = FirebaseAuth.instance;
  int selectedStep = 0;
  bool needLocation = false;
  bool goToMap = false;
  List<Placemark> placemarks = [];
  Address myAddress = Address();
  bool haveAddress = false;
  double priceWithTax = -1;
  List<OrdersToDelever> deleverList = [];
  addToDeleveryList(OrdersToDelever ordersToDelever) {
    deleverList.add(ordersToDelever);
    addToOrderList(AllOrders(ordersToDelever: deleverList));
  }

  goToMapMethod(bool change) {
    goToMap = change;
    notifyListeners();
  }

  selectStep(int step) {
    selectedStep = step;
    notifyListeners();
  }

  nextStep() {
    selectedStep = selectedStep + 1;

    notifyListeners();
  }

  previousStep() {
    selectedStep = selectedStep - 1;

    notifyListeners();
  }

  checkAddress() {
    _databaceRef
        .child('User')
        .child(_auth.currentUser!.uid)
        .child('address')
        .get()
        .then((value) {
      if (value.exists) {
        needLocation = false;
        haveAddress = true;

        var address = value.value as Map;
        myAddress = Address.fromJson(address);
      }
    });
  }

  convertLatlngToAddress(LatLng latLng) async {
    placemarks =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    myAddress.addressName = '${placemarks.reversed.last.country} '
        ' ${placemarks.reversed.last.locality} '
        ' ${placemarks.reversed.first.street} '
        ' ${placemarks.reversed.first.subLocality}';
    getAddress(Address(
        latitude: latLng.latitude,
        longitude: latLng.longitude,
        addressName: myAddress.addressName));
  }

  getAddress(Address address) {
    myAddress = address;
  }

  addAddress(Address address) {
    _databaceRef
        .child('User')
        .child(_auth.currentUser!.uid)
        .child('address')
        .set(address.toJson())
        .then((value) {})
        .catchError((e) {
      EasyLoading.showError('Somthing wrong',
          duration: const Duration(seconds: 2));
    });
  }

  addMyOrders(MyOrder myOrder) {
    _databaceRef
        .child('ShoppingBag')
        .child(_auth.currentUser!.uid)
        .set(myOrder.toJson())
        .then((value) {});
  }

  addToOrderList(AllOrders allOrders) {
    EasyLoading.show(
        indicator: Lottie.asset(
          'assets/lf20_izt3mhdr.json',
        ),
        status: 'Loading....');

    _databaceRef
        .child('OrderList')
        .child(_auth.currentUser!.uid)
        .set(allOrders.toJson())
        .then((value) {
      _databaceRef
          .child('ShoppingBag')
          .child(_auth.currentUser!.uid)
          .remove()
          .then((value) {
        nextStep();
        EasyLoading.dismiss();
      });
    }).catchError((e) {
      EasyLoading.showError('Somting Wrong');
    });
  }

  calculatePriceWithTax(double totalPrice) {
    priceWithTax = totalPrice + 3;
    selectedStep = 0;
  }
}
