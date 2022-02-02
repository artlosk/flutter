import 'package:bloc_custom/views/product_item.dart';
import 'package:flutter/material.dart';
import 'package:bloc_custom/models/product_data.dart';

class ProductInfo extends StatelessWidget {
  static const String routeName = '/product-info';

  const ProductInfo({Key? key, required this.customBloc, required this.product}) : super(key: key);
  final ProductData product;
  final customBloc;

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
                icon: Icon(Icons.shopping_cart),
              )
            ],
          ),
          body:
              ProductItem(
                  customBloc: customBloc,
                  product: product,
                  btnMore: false,
                ),
        );
  }
}
