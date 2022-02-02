import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:state_mobx/observables/common_observable.dart';
import 'package:state_mobx/views/cart_list.dart';
import 'package:state_mobx/views/product_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CommonState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (context) {
          return Text(state.tabs[state.activeTabIndex].title);
        }),
      ),
      body:  Observer(builder: (context) {
        if (state.activeTabIndex == 0) {
          return ProductList(products: state.products);
        } else {
          return CartList(products: state.cart);
        }
      }),
      bottomNavigationBar: Observer(builder: (context) {
        return BottomNavigationBar(
          currentIndex: state.activeTabIndex,
          onTap: state.updateTab,
          items: [
            for (final item in state.tabs)
              BottomNavigationBarItem(
                label: item.title,
                icon: item.icon,
              ),
          ],
        );
      }),
    );
  }
}
