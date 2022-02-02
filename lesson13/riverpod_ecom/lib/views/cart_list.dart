import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_ecom/models/cart_product.dart';
import 'package:riverpod_ecom/providers/state_provider.dart';
import 'package:riverpod_ecom/views/cart_item.dart';

class CartList extends ConsumerWidget {
  const CartList({Key? key, required this.products}) : super(key: key);
  final List<CartProduct> products;
  static const String routeName = '/cart';

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final cart = watch(cartProvider);
    return ListView.builder(
      itemCount: cart.length,
      itemBuilder: (BuildContext context, int index) {
         final product = cart[index];
         return CartItem(product: product);
      },
    );
  }
}
