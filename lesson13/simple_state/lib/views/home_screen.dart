import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:simple_state/models/tab_item.dart';
import 'package:simple_state/states/product_notifier.dart';
import 'package:simple_state/views/cart_list.dart';
import 'package:simple_state/views/product_list.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductState>(builder: (context, state, child) {
      if (!state.isLoaded) {
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
            title: Text(state.appBarTitle),
          ),
          body: state.activeTabIndex == 0
              ? ProductList(products: state.products)
              : CartList(products: state.cartProducts),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.activeTabIndex,
            onTap: (index) {
              state.updateTab(index);
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
    });
  }
}
