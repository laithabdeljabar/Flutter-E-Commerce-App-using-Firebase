import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:l_and_u/authentication/authentication_repository/authentication_repository.dart';
import 'package:l_and_u/authentication/screen/authentication.dart';

import 'package:l_and_u/shopping_bag/model/order.dart';
import 'package:l_and_u/shopping_bag/repository/shopping_bag_repository.dart';

import '../../checkout/checkout_repository/checkout_repository.dart';
import '../../checkout/screen/checkout.dart';
import '../../component/const.dart';
import '../../product_ditails/widget/bottom_button.dart';
import 'calculate_total_price.dart';

class FixedBottomSheet extends StatelessWidget {
  const FixedBottomSheet({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.22,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: const Color(fontColor),
          boxShadow: [
            BoxShadow(
                offset: const Offset(9, 9),
                color: Colors.black.withAlpha(22),
                blurRadius: 16)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CalculateTotalPrice(),
          InkWell(
            onTap: () {
              Provider.of<AuthenticationRepository>(context, listen: false)
                      .isLogin()
                  ? {
                      Provider.of<CheckoutRepository>(context, listen: false)
                          .addMyOrders(MyOrder(
                              totalPrice: Provider.of<ShoppinBagRepository>(
                                      context,
                                      listen: false)
                                  .totalPrice,
                              orders: Provider.of<ShoppinBagRepository>(context,
                                      listen: false)
                                  .selectedOrders)),
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Checkout(
                                    myOrder: MyOrder(
                                        totalPrice:
                                            Provider.of<ShoppinBagRepository>(
                                                    context,
                                                    listen: false)
                                                .totalPrice,
                                        orders:
                                            Provider.of<ShoppinBagRepository>(
                                                    context,
                                                    listen: false)
                                                .selectedOrders),
                                  )))
                    }
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Authentication()));
            },
            child: BottomButton(
              topPadding: size.height * 0.02,
              color: mainColor,
              child: const Text(
                'Checkout',
                style: TextStyle(fontSize: 25),
              ),
            ),
          )
        ],
      ),
    );
  }
}
