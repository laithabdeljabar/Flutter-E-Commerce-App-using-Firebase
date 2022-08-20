import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../component/const.dart';
import '../../../product/model/product.dart';
import '../product_ditails_repository/product_ditails_repository.dart';

class ProductNameAndPrice extends StatefulWidget {
  const ProductNameAndPrice(
      {Key? key,
      required this.size,
      required this.proudct,
      required this.oldPrice})
      : super(key: key);

  final Size size;
  final Proudct proudct;
  final double oldPrice;

  @override
  State<ProductNameAndPrice> createState() => _ProductNameAndPriceState();
}

class _ProductNameAndPriceState extends State<ProductNameAndPrice> {
  ProductDitailsRepository ditailsRepository = ProductDitailsRepository();
  @override
  void initState() {
    if (Provider.of<ProductDitailsRepository>(context, listen: false).toEdit ==
        false) {
      Provider.of<ProductDitailsRepository>(context, listen: false)
          .intiialPrice(widget.proudct.price!.value ?? -1);
    } else {
      Provider.of<ProductDitailsRepository>(context, listen: false)
          .intiialPrice(widget.oldPrice);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    // var rep = Provider.of<ProductDitailsRepository>(context, listen: false)
    //     .counter(widget.proudct.price!.value ?? -1);
    return Container(
      width: widget.size.width * 0.7,
      height: widget.size.height * 0.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: radius, bottomLeft: radius),
          color: const Color(mainColor),
          boxShadow: [shadow]),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              widget.proudct.name ?? '',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: widget.size.height * 0.013,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 13),
            child: Align(
                alignment: Alignment.bottomRight,
                child: Consumer<ProductDitailsRepository>(
                  builder: (context, value, child) {
                    return Text(
                      '\$${value.price.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 25),
                    );
                  },
                )),
          ),
        ],
      )),
    );
  }
}
