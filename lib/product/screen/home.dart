import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:l_and_u/component/animation/fade_animation.dart';
import 'package:l_and_u/component/const.dart';
import 'package:l_and_u/product/product_repository/product_repository.dart';
import 'package:l_and_u/product_ditails/product_ditails_repository/product_ditails_repository.dart';

import '../../shopping_bag/repository/shopping_bag_repository.dart';
import '../../shopping_bag/screen/shopping_bag.dart';

import '../widget/addpar_container.dart';
import '../widget/custom_appbar.dart';

import '../widget/home_drawe.dart';
import '../widget/product_list.dart';
import '../widget/search_textfield.dart';
import '../widget/shopping_bag_botton.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Provider.of<ProductRepository>(context, listen: false).data();
    Provider.of<ShoppinBagRepository>(context, listen: false).checkOldOrders();
    Provider.of<ProductDitailsRepository>(context, listen: false).endEdit();
    return Scaffold(
        backgroundColor: const Color(backgroundColor),
        body: SafeArea(
            child: Stack(
          children: [
            Column(
              children: [
                FadeAnimation(
                    delay: 1,
                    child: CustomAppBar(
                      leading: AppBarContainer(
                        size: size,
                        child: InkWell(
                          onTap: () {
                            Provider.of<ProductRepository>(context,
                                    listen: false)
                                .openCloseDrawe();
                          },
                          child: Center(
                            child: Image.asset(
                              'assets/images/menu (1).png',
                              width: 20,
                              color: const Color(fontColor),
                            ),
                          ),
                        ),
                      ),
                      action: AppBarContainer(
                          size: size,
                          child: Consumer<ShoppinBagRepository>(
                            builder: (context, value, child) {
                              return InkWell(
                                onTap: () {
                                  value.checkList();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ShoppingBag()));
                                },
                                child: const ShoppingBagBottun(),
                              );
                            },
                          )),
                    )),
                FadeAnimation(
                    delay: 2, child: SearchTextField(controller: controller)),
                ProductList(size: size)
              ],
            ),
            const HomeDrawer()
          ],
        )));
  }
}
