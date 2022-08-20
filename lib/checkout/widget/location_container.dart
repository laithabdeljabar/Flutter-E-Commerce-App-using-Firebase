import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:l_and_u/checkout/checkout_repository/checkout_repository.dart';

import '../../component/const.dart';

class LocationContainer extends StatelessWidget {
  const LocationContainer(
      {Key? key,
      required this.margin,
      required this.size,
      required this.borderRadius})
      : super(key: key);

  final Size size;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry margin;
  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutRepository>(
      builder: (context, value, child) {
        return Container(
            margin: margin,
            height: size.height * 0.1,
            decoration: BoxDecoration(
                color: const Color(mainColor),
                boxShadow: [shadow],
                borderRadius: borderRadius),
            child: value.myAddress.addressName != null
                ? Center(
                    child: ListTile(
                      title: Text(value.myAddress.addressName ?? ''),
                      leading: Image.asset(
                        'assets/images/address.png',
                        color: const Color(fontColor),
                        width: 35,
                      ),
                    ),
                  )
                : const SizedBox());
      },
    );
  }
}
