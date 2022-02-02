import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_ecom/models/tab_item.dart';
import 'package:riverpod_ecom/views/cart_list.dart';
import 'package:riverpod_ecom/views/product_list.dart';
import '../providers/state_provider.dart';

class HomeScreen extends HookWidget {
  static const routeName = '/';

  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    final tab = useProvider(tabProvider);
    final isLoaded = useProvider(loadingProvider);
    final products = useProvider(productsProvider);
    final cartProducts = useProvider(cartProvider);
    if (!isLoaded) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Загружаем данные'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(tab.state.title),
        ),
        body: tab.state == tabBar[0]
            ? ProductList(products: products)
            : CartList(products: cartProducts),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tab.state.index,
          onTap: (index) {
            tab.state = tabBar[index];
          },
          items: [
            for (final item in tabBar)
              BottomNavigationBarItem(
                label: item.title,
                icon: item.icon,
              )
          ],
        ),
      );
    }
  }
}
