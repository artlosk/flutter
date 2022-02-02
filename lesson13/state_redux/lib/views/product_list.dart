import 'package:flutter/material.dart';
import 'package:state_redux/models/product_data.dart';
import 'package:state_redux/views/product_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key, required this.products}) : super(key: key);
  final List<ProductData> products;
  static const String routeName = '/product-list';

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.5,
      ),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];
        return ProductItem(
          product: product,
          btnMore: true,
        );
      },
    );
  }
}
