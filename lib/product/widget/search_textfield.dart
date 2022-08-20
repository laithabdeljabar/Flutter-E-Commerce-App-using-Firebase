import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:l_and_u/component/const.dart';

import '../product_repository/product_repository.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    var productRepository =
        Provider.of<ProductRepository>(context, listen: false);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.02,
        vertical: size.width * 0.02,
      ),
      padding: EdgeInsets.only(left: size.width * 0.1),
      decoration: BoxDecoration(
          color: const Color(mainColor),
          borderRadius: BorderRadius.only(topRight: radius, bottomLeft: radius),
          boxShadow: [shadow]),
      child: TextField(
        onChanged: productRepository.searchproduct,
        controller: controller,
        decoration: const InputDecoration(
            hintText: 'Search...',
            icon: Icon(Icons.search),
            border: InputBorder.none),
      ),
    );
  }
}
