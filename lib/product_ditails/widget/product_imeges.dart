import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:l_and_u/product_ditails/product_ditails_repository/product_ditails_repository.dart';

import '../../../component/const.dart';
import '../../../product/model/product.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({
    Key? key,
    required this.size,
    required this.proudct,
  }) : super(key: key);

  final Size size;
  final Proudct proudct;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDitailsRepository>(
      builder: (context, value, child) {
        return Container(
          decoration: BoxDecoration(boxShadow: [shadow]),
          height: size.height * 0.8,
          child: PageView.builder(
            onPageChanged: (valu) => value.changeIndex(valu),
            itemCount: 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return FadeInImage.assetNetwork(
                  placeholder: 'assets/images/placeholder-image-300x225.png',
                  image: proudct.images![0].url ?? '',
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              }
              return FadeInImage.assetNetwork(
                placeholder: 'assets/images/placeholder-image-300x225.png',
                image: proudct.articles![0].logoPicture![0].url ?? '',
                //  width: double.infinity,
                fit: BoxFit.cover,
              );
            },
          ),
        );
      },
    );
  }
}
