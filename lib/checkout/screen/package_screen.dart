import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:l_and_u/checkout/screen/order_list.dart';

import 'package:l_and_u/checkout/widget/price_details.dart';
import 'package:l_and_u/component/const.dart';
import 'package:l_and_u/shopping_bag/model/order.dart';

import '../../product_ditails/widget/bottom_button.dart';
import '../../shopping_bag/repository/shopping_bag_repository.dart';

// ignore: must_be_immutable
class PackageScreen extends StatelessWidget {
  final MyOrder myOrder;
  PackageScreen({Key? key, required this.myOrder}) : super(key: key);
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      margin: EdgeInsets.only(top: size.height * 0.15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/shopping.png',
              width: size.width * 0.4,
              color: const Color(fontColor),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.03, bottom: size.height * 0.02),
              child: const Text(
                'Purchase completed successfully',
                style: TextStyle(fontSize: 17),
              ),
            ),
            PriceDetails(size: size),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: ListTile(
                leading: const Icon(
                  Icons.alarm,
                  color: Color(fontColor),
                ),
                title: Text(
                  'Your order will arrive between ${date.year}/${date.month}/${(date.day + 1)} and ${date.year}/${date.month}/${(date.day + 3)} ',
                  style: const TextStyle(fontSize: 17),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.height * 0.04),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(mainColor),
                  boxShadow: [shadow]),
              child: Center(
                child: ListTile(
                  leading: const Text(
                    'My orders',
                    style: TextStyle(fontSize: 17),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    OrderList(myOrder: myOrder)));
                      },
                      icon: const Icon(
                        Icons.east,
                        color: Color(fontColor),
                      )),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Provider.of<ShoppinBagRepository>(context, listen: false)
                    .selectedOrders
                    .clear();
                Provider.of<ShoppinBagRepository>(context, listen: false)
                    .restTotalPrice();
                Navigator.restorablePushNamed(context, "/");
              },
              child: BottomButton(
                color: fontColor,
                topPadding: size.height * 0.02,
                child: const Text(
                  'Back to Home Page',
                  style: TextStyle(color: Color(mainColor), fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
