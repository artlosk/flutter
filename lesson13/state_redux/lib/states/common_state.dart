import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:state_redux/models/cart_product.dart';
import 'package:state_redux/models/product_data.dart';
import 'package:state_redux/models/tab_item.dart';

@immutable
class CommonState {
  final bool isLoading;
  final List<ProductData> products;
  final List<CartProduct> cart;
  final int activeTab;
  final List<TabItem> tabs;

  const CommonState(
      {this.isLoading = false,
      this.products = const [],
      this.cart = const [],
      this.activeTab = 0,
      this.tabs = const []});

  factory CommonState.loading() => const CommonState(isLoading: true);

  CommonState copyWith({
    bool? isLoading,
    List<ProductData>? products,
    List<CartProduct>? cart,
    int? activeTab,
    List<TabItem>? tabs
  }) {
    return CommonState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      cart: cart ?? this.cart,
      activeTab: activeTab ?? this.activeTab,
      tabs: tabs ?? this.tabs
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommonState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          products == other.products &&
          cart == other.cart &&
          activeTab == other.activeTab &&
          tabs == other.tabs;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      products.hashCode ^
      cart.hashCode ^
      activeTab.hashCode ^
      tabs.hashCode;

  @override
  String toString() {
    return 'CommonState{isLoading: $isLoading, '
        'products: $products, cart: $cart, activeTab: $activeTab, tabs: $tabs}';
  }

  List<TabItem> updateBarCart() {
    int sum = 0;

    cart.map((e) {
      sum += e.qty.toInt();
    }).toList();

    tabs[1].title = 'Корзина ($sum)';
    return tabs;
  }
}
