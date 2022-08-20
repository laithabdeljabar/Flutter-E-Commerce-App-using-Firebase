import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:l_and_u/authentication/authentication_repository/authentication_repository.dart';

import 'package:l_and_u/component/animation/fade_animation.dart';
import 'package:l_and_u/component/const.dart';
import 'package:l_and_u/product/widget/addpar_container.dart';
import 'package:l_and_u/product/widget/custom_appbar.dart';
import 'package:l_and_u/product_ditails/product_ditails_repository/product_ditails_repository.dart';

import 'package:l_and_u/shopping_bag/repository/shopping_bag_repository.dart';
import 'package:l_and_u/shopping_bag/widget/selected_orders_list.dart';

import '../../authentication/screen/authentication.dart';
import '../../user_profile/screen/profile.dart';
import '../widget/empty_shopping_bag.dart';
import '../widget/fixed_bottom_sheet.dart';

class ShoppingBag extends StatelessWidget {
  const ShoppingBag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Provider.of<ProductDitailsRepository>(context, listen: false).endEdit();

    var authenticationRepository =
        Provider.of<AuthenticationRepository>(context, listen: false);
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(backgroundColor),
          body: Consumer<ShoppinBagRepository>(
            builder: (context, value, child) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    CustomAppBar(
                        leading: InkWell(
                          onTap: () {
                            Navigator.restorablePushNamed(context, "/");
                          },
                          child: AppBarContainer(
                            size: size,
                            child: Center(
                              child: Image.asset(
                                'assets/images/home.png',
                                width: 20,
                                color: const Color(fontColor),
                              ),
                            ),
                          ),
                        ),
                        action: InkWell(
                          onTap: () {
                            authenticationRepository.isLogin()
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Profile()))
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Authentication()));
                          },
                          child: AppBarContainer(
                            size: size,
                            child: Center(
                              child: Image.asset(
                                'assets/images/avatar.png',
                                width: 20,
                                color: const Color(fontColor),
                              ),
                            ),
                          ),
                        )),
                    if (value.selectedOrders.isEmpty)
                      EmptyShoppingBag(size: size)
                    else
                      Stack(
                        children: [
                          FadeAnimation(
                              delay: 1, child: SeletedOrdersList(size: size)),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: FixedBottomSheet(size: size),
                          ),
                        ],
                      )
                  ],
                ),
              );
            },
          )),
    );
  }
}
