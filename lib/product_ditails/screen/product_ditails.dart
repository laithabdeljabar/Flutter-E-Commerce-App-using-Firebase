import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:l_and_u/component/animation/fade_animation.dart';
import 'package:l_and_u/component/const.dart';
import 'package:l_and_u/shopping_bag/screen/shopping_bag.dart';

import '../../product/model/product.dart';
import '../../product/widget/addpar_container.dart';
import '../../shopping_bag/model/order.dart';
import '../../shopping_bag/repository/shopping_bag_repository.dart';
import '../product_ditails_repository/product_ditails_repository.dart';
import '../widget/bottom_button.dart';
import '../widget/colors_ditails.dart';

import '../widget/counter.dart';
import '../widget/custom_container.dart';
import '../widget/product_imeges.dart';
import '../widget/product_name_and_price.dart';
import '../widget/selected_dot.dart';
import '../widget/size_ditails.dart';

class ProductDitails extends StatelessWidget {
  final Proudct proudct;
  final int index;
  final int colorIndex;
  final int sizeIndex;
  final double number;
  final double oldPrice;

  const ProductDitails(
      {Key? key,
      required this.proudct,
      required this.index,
      required this.oldPrice,
      required this.number,
      required this.colorIndex,
      required this.sizeIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var shoppinBagRepository =
        Provider.of<ShoppinBagRepository>(context, listen: false);
    // ignore: unused_local_variable
    var productRepository =
        Provider.of<ProductDitailsRepository>(context, listen: false);
    productRepository.startEdit(colorIndex, sizeIndex);
    productRepository.restCounter(number);
    shoppinBagRepository.totalOrdersPrice(-oldPrice);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(backgroundColor),
        body: SingleChildScrollView(
          child: Consumer<ProductDitailsRepository>(
            builder: (context, value, child) {
              return Column(
                children: [
                  Stack(children: [
                    FadeAnimation(
                        delay: 1,
                        child: ProductImages(size: size, proudct: proudct)),
                    if (value.toEdit == false)
                      Positioned(
                        top: 15,
                        left: 10,
                        child: AppBarContainer(
                          size: size,
                          child: Center(
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  value.restCounter(number);
                                },
                                icon: const Icon(Icons.arrow_back_ios_new)),
                          ),
                        ),
                      ),
                    Positioned(
                        top: size.height * 0.76,
                        left: size.width * 0.46,
                        child: const SelectedDot()),
                  ]),
                  FadeAnimation(
                    delay: 1.5,
                    child: Padding(
                      padding: EdgeInsets.only(top: size.height * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ProductNameAndPrice(
                            size: size,
                            proudct: proudct,
                            oldPrice: oldPrice,
                          ),
                          Counter(
                            size: size,
                            product: proudct,
                            newCount: number,
                          ),
                        ],
                      ),
                    ),
                  ),
                  FadeAnimation(
                    delay: 2,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomContainer(
                            width: size.width * 0.35,
                            size: size,
                            child: SizeDitails(
                              proudct: proudct,
                              sizeIndex: sizeIndex,
                            ),
                          ),
                          CustomContainer(
                            width: size.width * 0.35,
                            size: size,
                            child: ColorsDitails(
                              proudct: proudct,
                              colorIndex: colorIndex,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      value.toEdit
                          ? {
                              shoppinBagRepository.updateOrder(
                                  index,
                                  Order(
                                      colorIndex: value.selecedColor,
                                      sizeIndex: value.selectedSize,
                                      totalPrice: value.price,
                                      product: proudct,
                                      orderCode: proudct
                                          .articleCodes![value.selecedColor],
                                      orderColorName:
                                          proudct.articleColorNames![
                                              value.selecedColor],
                                      colorNumber: proudct
                                          .rgbColors![value.selecedColor],
                                      orderName: proudct.name ?? '',
                                      price: proudct.price!.value ?? -1,
                                      images: proudct.images![0].url ?? '',
                                      number: value.count,
                                      orderSize: proudct
                                              .variantSizes![value.selectedSize]
                                              .filterCode ??
                                          ''),
                                  false),
                            }
                          : {
                              shoppinBagRepository.selectedOrders.add(Order(
                                  colorIndex: value.selecedColor,
                                  sizeIndex: value.selectedSize,
                                  totalPrice: value.price,
                                  product: proudct,
                                  orderCode:
                                      proudct.articleCodes![value.selecedColor],
                                  orderColorName: proudct
                                      .articleColorNames![value.selecedColor],
                                  colorNumber:
                                      proudct.rgbColors![value.selecedColor],
                                  orderName: proudct.name ?? '',
                                  price: proudct.price!.value ?? -1,
                                  images: proudct.images![0].url ?? '',
                                  number: value.count,
                                  orderSize: proudct
                                          .variantSizes![value.selectedSize]
                                          .filterCode ??
                                      '')),
                              shoppinBagRepository
                                  .totalOrdersPrice(value.price),
                            };
                      if (shoppinBagRepository.haveOldOrders) {
                        shoppinBagRepository.updateMyOrders(MyOrder(
                            totalPrice: shoppinBagRepository.totalPrice,
                            orders: shoppinBagRepository.selectedOrders));
                      }
                      value.restCounter(number);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ShoppingBag()));
                    },
                    child: BottomButton(
                      topPadding: size.height * 0.04,
                      color: fontColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/shopping-bag.png',
                            width: 30,
                            color: const Color(mainColor),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            value.toEdit ? 'Edit order' : 'Add to Bag',
                            style: const TextStyle(
                              fontSize: 19,
                              color: Color(mainColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
