import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:l_and_u/product/widget/product_colors_list.dart';
import 'package:l_and_u/product_ditails/product_ditails_repository/product_ditails_repository.dart';
import 'package:l_and_u/product_ditails/screen/product_ditails.dart';
import 'package:l_and_u/shopping_bag/model/order.dart';
import 'package:l_and_u/shopping_bag/repository/shopping_bag_repository.dart';

import '../../component/animation/fade_animation.dart';
import '../../component/const.dart';
import '../product_repository/product_repository.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    var shoppinBagRepository =
        Provider.of<ShoppinBagRepository>(context, listen: false);
    return Consumer<ProductRepository>(
      builder: (context, value, child) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 15, bottom: 5),
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.02,
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 345, //size.height * 0.47,

                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: value.products.length,
              itemBuilder: (context, index) {
                return FadeAnimation(
                  delay: index < 3 ? (index + 0.1) : 2,
                  child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: index % 2 == 0
                              ? const BorderRadius.only(
                                  topRight: Radius.circular(66),
                                )
                              : const BorderRadius.only(
                                  topLeft: Radius.circular(66),
                                ),
                          color: const Color(mainColor),
                          boxShadow: [shadow]),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ProductDitails(
                                oldPrice: 0,
                                colorIndex: 0,
                                sizeIndex: 0,
                                number: value.products[index].numbersOfPieces!
                                    .toDouble(),
                                index: index,
                                proudct: value.products[index]);
                          }));
                        },
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: index % 2 == 0
                                  ? const BorderRadius.only(
                                      topRight: Radius.circular(66),
                                    )
                                  : const BorderRadius.only(
                                      topLeft: Radius.circular(66),
                                    ),
                              child: Stack(
                                children: [
                                  FadeInImage.assetNetwork(
                                    placeholder:
                                        'assets/images/placeholder-image-300x225.png',
                                    image:
                                        value.products[index].images![0].url ??
                                            '',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    right: 10,
                                    child: GestureDetector(
                                      onTap: () {
                                        shoppinBagRepository.selectedOrders.add(Order(
                                            sizeIndex:
                                                Provider.of<ProductDitailsRepository>(context, listen: false)
                                                    .selectedIndex,
                                            colorIndex:
                                                Provider.of<ProductDitailsRepository>(
                                                        context,
                                                        listen: false)
                                                    .selecedColor,
                                            totalPrice: value.products[index]
                                                    .price!.value ??
                                                -1,
                                            product: value.products[index],
                                            orderCode: value.products[index]
                                                .articleCodes![0],
                                            orderColorName: value
                                                .products[index]
                                                .articleColorNames![0],
                                            colorNumber: value.products[index].rgbColors![0],
                                            orderName: value.products[index].name ?? '',
                                            price: value.products[index].price!.value ?? -1,
                                            images: value.products[index].images![0].url ?? '',
                                            number: 1,
                                            orderSize: value.products[index].variantSizes![0].filterCode ?? ''));
                                        shoppinBagRepository.totalOrdersPrice(
                                          value.products[index].price!.value ??
                                              -1,
                                        );
                                        shoppinBagRepository.selectProduct();
                                        if (shoppinBagRepository
                                            .haveOldOrders) {
                                          shoppinBagRepository.updateMyOrders(
                                              MyOrder(
                                                  totalPrice:
                                                      shoppinBagRepository
                                                          .totalPrice,
                                                  orders: shoppinBagRepository
                                                      .selectedOrders));
                                        }
                                      },
                                      child: Image.asset(
                                        'assets/images/shopping-bag.png',
                                        width: 20,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3, top: 7),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(value.products[index].name ?? '',
                                      overflow: TextOverflow.ellipsis),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      value.products[index].price!
                                              .formattedValue ??
                                          '',
                                    ),
                                  ),
                                  ProductColorsList(
                                    proudct: value.products[index],
                                    height: 15,
                                    width: 15,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
