import 'package:bloc_custom/states/product_state.dart';

import 'cart_state.dart';

class TabState {
  final ProductState productState;
  final CartState cartState;
  final int activeTabIndex;

  TabState(
      {this.productState = const ProductState(), this.cartState = const CartState(), this.activeTabIndex = 0});

  TabState copyWith({
    ProductState ? productState,
    CartState ? cartState,
    int? activeTabIndex,
  }) {
    return TabState(
      productState: productState ?? this.productState,
      cartState: cartState ?? this.cartState,
      activeTabIndex: activeTabIndex ?? this.activeTabIndex,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TabState &&
              runtimeType == other.runtimeType &&
              activeTabIndex == other.activeTabIndex;

  @override
  int get hashCode => activeTabIndex.hashCode;

  @override
  String toString() =>
      'TabState{activeIndexTab: $activeTabIndex}';
}
