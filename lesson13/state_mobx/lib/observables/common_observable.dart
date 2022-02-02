import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:state_mobx/models/cart_product.dart';
import 'package:state_mobx/models/product_data.dart';
import 'package:state_mobx/models/tab_item.dart';
import 'package:state_mobx/services/product_service.dart';

part 'common_observable.g.dart';

class CommonState = _CommonState with _$CommonState;

abstract class _CommonState with Store {

  @observable
  List<ProductData> products = [];

  @observable
  List<CartProduct> cart = [];

  @observable
  List<TabItem> tabs = [];

  @observable
  int activeTabIndex = 0;

  @computed
  bool get isLoaded => products.isNotEmpty && tabs.isNotEmpty;

  _CommonState() {
    _initTabs();
    _initProducts();
    _initCart();
  }

  @action
  Future<void> _initTabs() async {
    tabs = [
      TabItem(title: "Список товаров", icon: const Icon(Icons.list)),
      TabItem(title: "Корзина (0)", icon: const Icon(Icons.add_shopping_cart)),
    ];
  }

  @action
  Future<void> _initProducts() async {
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );
    products = await ProductService().getList('assets/products.json');
  }

  @action
  void _initCart() {
    cart = [];
  }

  @action
  void updateTab(int index) {
    activeTabIndex = index;
  }

  @action
  void addProduct(ProductData product) {
    var _list = [...cart];
    int qty = 1;
    _list.map((e) {
      if (e.product.id == product.id) {
        qty = e.qty + 1;
      }
    }).toList();

    _list.removeWhere((element) => element.product.id == product.id);
    _list.add(CartProduct(qty: qty, product: product));
    cart = _list;

    updateBarCart();
  }

  @action
  void deleteProduct(int id) {
    var _list = [...cart];
    _list.removeWhere((element) => element.product.id == id);
    cart = _list;
    updateBarCart();
  }

  @action
  void updateBarCart() {
    int sum = 0;

    cart.map((e) {
      sum += e.qty.toInt();
    }).toList();

    var tmpTabs = [...tabs];

    tmpTabs[1].title = 'Корзина ($sum)';
    tabs = tmpTabs;
  }
}
