import 'package:flutter/material.dart';

import '../model/order.dart';

class SelectedOrderImage extends StatelessWidget {
  const SelectedOrderImage({
    Key? key,
    required this.order,
    required this.size,
  }) : super(key: key);

  final Order order;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/images/placeholder-image-300x225.png',
        image: order.images,
        width: size.width * 0.15,
      ),
    );
  }
}
