import 'package:flutter/material.dart';
import 'package:simple_state/models/cart_product.dart';
import 'package:simple_state/models/product_data.dart';
import 'package:simple_state/services/product_service.dart';
import 'package:simple_state/models/tab_item.dart';

class ProductState with ChangeNotifier {
  List<ProductData> products = [];
  List<CartProduct> cartProducts = [];

  bool get isLoaded => products.isNotEmpty;
  int activeTabIndex = 0;
  String appBarTitle = '';
  int totalProductsCart = 0;

  _initProducts() async {
    products = await ProductService().getList('assets/products.json');
    notifyListeners();
  }

  ProductState() {
    _initProducts();
    appBarTitle = tabBar[0].title;
  }

  void updateTab(int index) {
    activeTabIndex = index;
    appBarTitle = tabBar[index].title;
    notifyListeners();
  }

  void addToCart(ProductData product) {
    int qty = 1;
    if (cartProducts.isNotEmpty) {

      cartProducts.map((e) {
        if (e.product.id == product.id) {
          qty = e.qty + 1;
        }
      }).toList();
    }

    cartProducts.removeWhere((element) => element.product.id == product.id);
    cartProducts.add(CartProduct(qty: qty, product: product));
    changeLabelBarCart();
    notifyListeners();
  }

  void changeLabelBarCart() {
    int sum = 0;
    cartProducts.map((e){
      sum += e.qty.toInt();
    }).toList();
    totalProductsCart = sum;
    tabBar[1].title = 'Корзина ($totalProductsCart)';
    notifyListeners();
  }

  void deleteItemFromCart(int id) {
    cartProducts.removeWhere((element) => element.product.id == id);
    changeLabelBarCart();
    appBarTitle = tabBar[activeTabIndex].title;
    notifyListeners();
  }
}
