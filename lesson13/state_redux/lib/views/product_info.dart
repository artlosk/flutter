import 'package:state_redux/views/product_item.dart';
import 'package:flutter/material.dart';
import 'package:state_redux/models/product_data.dart';

class ProductInfo extends StatelessWidget {
  static const String routeName = '/product-info';

  const ProductInfo({Key? key, required this.product}) : super(key: key);
  final ProductData product;

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  // state.updateTab(0);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.list),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  // state.updateTab(1);
                },
                icon: const Icon(Icons.shopping_cart),
              )
            ],
          ),
          body:
              ProductItem(
                  product: product,
                  btnMore: false,
                ),
        );
  }
}
