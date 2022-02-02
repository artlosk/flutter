// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_observable.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CommonState on _CommonState, Store {
  Computed<bool>? _$isLoadedComputed;

  @override
  bool get isLoaded => (_$isLoadedComputed ??=
          Computed<bool>(() => super.isLoaded, name: '_CommonState.isLoaded'))
      .value;

  final _$productsAtom = Atom(name: '_CommonState.products');

  @override
  List<ProductData> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<ProductData> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$cartAtom = Atom(name: '_CommonState.cart');

  @override
  List<CartProduct> get cart {
    _$cartAtom.reportRead();
    return super.cart;
  }

  @override
  set cart(List<CartProduct> value) {
    _$cartAtom.reportWrite(value, super.cart, () {
      super.cart = value;
    });
  }

  final _$tabsAtom = Atom(name: '_CommonState.tabs');

  @override
  List<TabItem> get tabs {
    _$tabsAtom.reportRead();
    return super.tabs;
  }

  @override
  set tabs(List<TabItem> value) {
    _$tabsAtom.reportWrite(value, super.tabs, () {
      super.tabs = value;
    });
  }

  final _$activeTabIndexAtom = Atom(name: '_CommonState.activeTabIndex');

  @override
  int get activeTabIndex {
    _$activeTabIndexAtom.reportRead();
    return super.activeTabIndex;
  }

  @override
  set activeTabIndex(int value) {
    _$activeTabIndexAtom.reportWrite(value, super.activeTabIndex, () {
      super.activeTabIndex = value;
    });
  }

  final _$_initTabsAsyncAction = AsyncAction('_CommonState._initTabs');

  @override
  Future<void> _initTabs() {
    return _$_initTabsAsyncAction.run(() => super._initTabs());
  }

  final _$_initProductsAsyncAction = AsyncAction('_CommonState._initProducts');

  @override
  Future<void> _initProducts() {
    return _$_initProductsAsyncAction.run(() => super._initProducts());
  }

  final _$_CommonStateActionController = ActionController(name: '_CommonState');

  @override
  void _initCart() {
    final _$actionInfo = _$_CommonStateActionController.startAction(
        name: '_CommonState._initCart');
    try {
      return super._initCart();
    } finally {
      _$_CommonStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTab(int index) {
    final _$actionInfo = _$_CommonStateActionController.startAction(
        name: '_CommonState.updateTab');
    try {
      return super.updateTab(index);
    } finally {
      _$_CommonStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addProduct(ProductData product) {
    final _$actionInfo = _$_CommonStateActionController.startAction(
        name: '_CommonState.addProduct');
    try {
      return super.addProduct(product);
    } finally {
      _$_CommonStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteProduct(int id) {
    final _$actionInfo = _$_CommonStateActionController.startAction(
        name: '_CommonState.deleteProduct');
    try {
      return super.deleteProduct(id);
    } finally {
      _$_CommonStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateBarCart() {
    final _$actionInfo = _$_CommonStateActionController.startAction(
        name: '_CommonState.updateBarCart');
    try {
      return super.updateBarCart();
    } finally {
      _$_CommonStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
cart: ${cart},
tabs: ${tabs},
activeTabIndex: ${activeTabIndex},
isLoaded: ${isLoaded}
    ''';
  }
}
