import 'package:bloc_custom/models/cart_product.dart';
import 'package:flutter/material.dart';
import 'cart_item.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key, required this.customBloc, required this.products}) : super(key: key);
  final List<CartProduct> products;
  final customBloc;
  static const String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];

        return CartItem(customBloc: customBloc, product: product);
      },
    );
  }
}
