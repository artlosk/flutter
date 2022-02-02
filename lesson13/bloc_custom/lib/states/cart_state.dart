import 'package:bloc_custom/models/cart_product.dart';
import 'package:bloc_custom/models/tab_item.dart';

class CartState {
  final List<CartProduct> cartProducts;
  final bool isLoading;
  final int totalQty;

  const CartState({
    this.cartProducts = const [],
    this.isLoading = true,
    this.totalQty = 0
  });

  CartState copyWith({
    List<CartProduct>? cartProducts,
    bool? isLoading,
    int? totalQty
  }) {
    return CartState(
      cartProducts: cartProducts ?? this.cartProducts,
      isLoading: isLoading ?? this.isLoading,
      totalQty: totalQty ?? this.totalQty
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartState &&
          runtimeType == other.runtimeType &&
          cartProducts == other.cartProducts &&
          isLoading == other.isLoading &&
          totalQty == other.totalQty;

  @override
  int get hashCode => cartProducts.hashCode & isLoading.hashCode & totalQty.hashCode;

  @override
  String toString() =>
      'CartState{cartProducts: $cartProducts, isLoading: $isLoading, totalQty: $totalQty}';

  List<CartProduct> getList() {
    return cartProducts;
  }

  int countTotalQty() {
    int sum = 0;

    cartProducts.map((e) {
      sum += e.qty.toInt();
    }).toList();

    return sum;
  }

  void changeTabCart()  {
    tabBar[1].title = 'Корзина (${countTotalQty()})';
  }
}
