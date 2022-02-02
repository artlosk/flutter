import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_ecom/models/product_data.dart';
import 'package:riverpod_ecom/models/tab_item.dart';
import 'package:riverpod_ecom/views/product_item.dart';
import '../providers/state_provider.dart';

class ProductInfo extends HookWidget {
  static const String routeName = '/product-info';

  const ProductInfo({Key? key, required this.product}) : super(key: key);
  final ProductData product;

  @override
  Widget build(BuildContext context) {
    final isLoaded = useProvider(loadingProvider);
    final tab = useProvider(tabProvider);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  tab.state = tabBar[0];
                  //state.updateTab(0);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.list),
              ),
              IconButton(
                onPressed: () {
                  tab.state = tabBar[1];
                  Navigator.pop(context);
                  //tab.state.updateTab(1);
                },
                icon: const Icon(Icons.shopping_cart),
              )
            ],
          ),
          body: !isLoaded
              ? const Center(child: CircularProgressIndicator())
              : ProductItem(
                  product: product,
                  btnMore: false,
                ),
        );
  }
}
