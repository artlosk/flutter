import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_ecom/models/cart_product.dart';
import 'package:riverpod_ecom/models/product_data.dart';
import 'package:riverpod_ecom/services/product_interface.dart';
import 'package:riverpod_ecom/services/product_service.dart';
import 'package:riverpod_ecom/models/tab_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductNotifier extends StateNotifier<List<ProductData>> {
  final ProductInterface products;

  ProductNotifier(this.products) : super([]) {
    _init();
  }

  void _init() async {
    state = await const ProductService().getList('assets/products.json');
  }
}

class CartNotifier extends StateNotifier<List<CartProduct>> {
  CartNotifier() : super([]);

  String appBarTitle = '';
  int totalProductsCart = 0;


  void addToCart(ProductData product) {
    List<CartProduct> _list = [...state];

    int qty = 1;
    if (_list.isNotEmpty) {

      _list.map((e) {
        if (e.product.id == product.id) {
          qty = e.qty + 1;
        }
      }).toList();
    }

    _list.removeWhere((element) => element.product.id == product.id);
    _list.add(CartProduct(qty: qty, product: product));
    state = _list;
    updateLabelBarCart();
  }

  void updateLabelBarCart() {
    int sum = 0;
    state.map((e){
      sum += e.qty.toInt();
    }).toList();
    totalProductsCart = sum;
    tabBar[1].title = 'Корзина ($totalProductsCart)';
  }

  void deleteItemFromCart(int id) {
    List<CartProduct> _list = [...state];
    _list.removeWhere((element) => element.product.id == id);
    state = _list;
    updateLabelBarCart();
  }
}
