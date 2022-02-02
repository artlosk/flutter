import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:state_redux/actions/product_action.dart';
import 'package:state_redux/actions/tab_action.dart';
import 'package:state_redux/models/tab_item.dart';
import 'package:state_redux/services/product_service.dart';
import 'package:state_redux/states/common_state.dart';

List<Middleware<CommonState>> createStoreMiddleware() {
  final loadTabBars = _createLoadTabBars();
  final loadProducts = _createLoadProducts();
  final changeTitle = _createChangeTitle();

  return [
    TypedMiddleware<CommonState, LoadTabBarsAction>(loadTabBars),
    TypedMiddleware<CommonState, LoadProductAction>(loadProducts),
    TypedMiddleware<CommonState, ChangeCartLabelAction>(changeTitle),
  ];
}

Middleware<CommonState> _createLoadTabBars() {
  return (Store<CommonState> store, action, NextDispatcher next) {

    final List<TabItem> tabBar = [
      TabItem(title: "Список товаров", icon: const Icon(Icons.list)),
      TabItem(title: "Корзина (0)", icon: const Icon(Icons.add_shopping_cart)),
    ];

    store.dispatch(TabBarsLoadedAction(tabBar));
    next(action);
  };
}

Middleware<CommonState> _createChangeTitle() {
  return (Store<CommonState> store, action, NextDispatcher next) {
    store.state.copyWith(tabs: store.state.updateBarCart());
    next(action);
  };
}

Middleware<CommonState> _createLoadProducts() {
  return (Store<CommonState> store, action, NextDispatcher next) async {
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );
    final list = await ProductService().getList('assets/products.json');
    store.dispatch(ProductLoadedAction(list));
    next(action);
  };
}
