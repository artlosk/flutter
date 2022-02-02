import 'package:state_redux/models/cart_product.dart';
import 'package:flutter/material.dart';

import 'cart_item.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key, required this.products}) : super(key: key);
  final List<CartProduct> products;
  static const String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];

        return CartItem(product: product);
      },
    );
  }
}
