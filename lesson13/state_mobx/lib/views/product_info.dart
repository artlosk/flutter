import 'package:flutter/material.dart';
import 'package:state_mobx/models/product_data.dart';
import 'package:state_mobx/views/product_item.dart';

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
            icon: Icon(Icons.list),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              // state.updateTab(1);
            },
            icon: Icon(Icons.shopping_cart),
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
