import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:l_and_u/product_ditails/product_ditails_repository/product_ditails_repository.dart';
import 'package:l_and_u/shopping_bag/widget/slidabel_widget.dart';

import '../../product/model/product.dart';
import '../../product_ditails/screen/product_ditails.dart';
import '../repository/shopping_bag_repository.dart';
import 'selected_order.dart';

class SeletedOrdersList extends StatelessWidget {
  const SeletedOrdersList({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppinBagRepository>(
      builder: (context, value, child) {
        return SizedBox(
            height: size.height * 0.9,
            child: ListView.builder(
              itemCount: value.selectedOrders.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Provider.of<ProductDitailsRepository>(context,
                            listen: false)
                        .editProdect();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDitails(
                                oldPrice:
                                    value.selectedOrders[index].totalPrice,
                                colorIndex:
                                    value.selectedOrders[index].colorIndex,
                                sizeIndex:
                                    value.selectedOrders[index].sizeIndex,
                                number: value.selectedOrders[index].number,
                                proudct: value.selectedOrders[index].product ??
                                    Proudct(),
                                index: index)));
                  },
                  child: Slidable(
                    key: UniqueKey(),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      extentRatio: 0.2,
                      children: [
                        InkWell(
                          onTap: () {
                            value.deleteOrder(
                              index,
                              value.selectedOrders[index].totalPrice,
                            );
                          },
                          child: SlideableWidget(
                            size: size,
                            slidAbleIcon: 'assets/images/delete (3).png',
                          ),
                        )
                      ],
                    ),
                    child: SelectedeOrder(
                      index: index,
                      size: size,
                      order: value.selectedOrders.elementAt(index),
                    ),
                  ),
                );
              },
            ));
      },
    );
  }
}
