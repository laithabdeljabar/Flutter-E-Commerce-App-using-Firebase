import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:provider/provider.dart';
import 'package:l_and_u/checkout/model/steps.dart';
import 'package:l_and_u/checkout/screen/location_screen.dart';

import 'package:l_and_u/checkout/widget/map.dart';
import 'package:l_and_u/checkout/screen/package_screen.dart';

import 'package:l_and_u/component/const.dart';
import 'package:l_and_u/shopping_bag/model/order.dart';

import '../checkout_repository/checkout_repository.dart';
import '../widget/back_dialog.dart';
import '../widget/blurs.dart';
import '../widget/checkout_steps.dart';
import 'information.dart';

class Checkout extends StatefulWidget {
  final MyOrder myOrder;
  const Checkout({Key? key, required this.myOrder}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  void initState() {
    Provider.of<CheckoutRepository>(context, listen: false)
        .calculatePriceWithTax(widget.myOrder.totalPrice);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await backDialog(context);
        return shouldPop ?? false;
      },
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: const Text('Checkout'),
              backgroundColor: const Color(fontColor),
            ),
            body: Consumer<CheckoutRepository>(
              builder: (context, value, child) {
                return Stack(
                  children: [
                    if (value.selectedStep == Steps.location.index)
                      value.goToMap ? const Maps() : const LocationScreen(),
                    if (value.selectedStep == Steps.information.index)
                      const Information(),
                    if (value.selectedStep == Steps.package.index)
                      PackageScreen(
                        myOrder: widget.myOrder,
                      ),
                    Positioned(
                      top: 10,
                      left: 10,
                      right: 10,
                      child: Blurs(
                        size,
                        const CheckoutStps(),
                        size.width,
                        size.height * 0.1,
                      ),
                    ),
                    Positioned(
                      bottom: size.height * 0.04,
                      left: 10,
                      right: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          value.selectedStep > Steps.location.index &&
                                  value.selectedStep < Steps.package.index
                              ? IconButton(
                                  onPressed: () {
                                    value.previousStep();
                                  },
                                  icon: Image.asset(
                                    'assets/images/previous.png',
                                    color: const Color(fontColor),
                                    width: 35,
                                  ),
                                )
                              : const SizedBox(),
                          value.selectedStep == Steps.information.index
                              ? InkWell(
                                  onTap: () {
                                    value.addToDeleveryList(OrdersToDelever(
                                      priceWithTax: value.priceWithTax,
                                      myOrder: widget.myOrder,
                                    ));
                                  },
                                  child: Container(
                                    height: size.height * 0.09,
                                    width: size.width * 0.8,
                                    decoration: BoxDecoration(
                                      color: const Color(fontColor),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Center(
                                        child: Text(
                                      'BUY',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    )),
                                  ),
                                )
                              : value.selectedStep == Steps.package.index
                                  ? const SizedBox()
                                  : value.goToMap == false
                                      ? IconButton(
                                          onPressed: () {
                                            if (value.haveAddress &&
                                                value.needLocation == false) {
                                              value.nextStep();
                                            } else {
                                              EasyLoading.showInfo(
                                                  'Pleas add your location',
                                                  duration: const Duration(
                                                      seconds: 2));
                                            }
                                          },
                                          icon: Image.asset(
                                            'assets/images/next (1).png',
                                            color: const Color(fontColor),
                                            width: 35,
                                          ),
                                        )
                                      : const SizedBox()
                        ],
                      ),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}
