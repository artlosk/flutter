// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_observable.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobxFirestore on MobxFirestoreBase, Store {
  final _$isLoadingAtom = Atom(name: 'MobxFirestoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$productsAtom = Atom(name: 'MobxFirestoreBase.products');

  @override
  List<ShoppingListModel> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<ShoppingListModel> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$filterAtom = Atom(name: 'MobxFirestoreBase.filter');

  @override
  Filter get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(Filter value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$orderAtom = Atom(name: 'MobxFirestoreBase.order');

  @override
  Order get order {
    _$orderAtom.reportRead();
    return super.order;
  }

  @override
  set order(Order value) {
    _$orderAtom.reportWrite(value, super.order, () {
      super.order = value;
    });
  }

  final _$createDocIfNotExistAsyncAction =
      AsyncAction('MobxFirestoreBase.createDocIfNotExist');

  @override
  Future createDocIfNotExist(UserModel? model) {
    return _$createDocIfNotExistAsyncAction
        .run(() => super.createDocIfNotExist(model));
  }

  final _$setItemsByUserAsyncAction =
      AsyncAction('MobxFirestoreBase.setItemsByUser');

  @override
  Future<dynamic> setItemsByUser(ShoppingListModel model) {
    return _$setItemsByUserAsyncAction.run(() => super.setItemsByUser(model));
  }

  final _$deleteItemByUserAsyncAction =
      AsyncAction('MobxFirestoreBase.deleteItemByUser');

  @override
  Future<dynamic> deleteItemByUser(ShoppingListModel model) {
    return _$deleteItemByUserAsyncAction
        .run(() => super.deleteItemByUser(model));
  }

  final _$deleteItemsByUserAsyncAction =
      AsyncAction('MobxFirestoreBase.deleteItemsByUser');

  @override
  Future<dynamic> deleteItemsByUser() {
    return _$deleteItemsByUserAsyncAction.run(() => super.deleteItemsByUser());
  }

  final _$setIsBuyFlagByUserAsyncAction =
      AsyncAction('MobxFirestoreBase.setIsBuyFlagByUser');

  @override
  Future<dynamic> setIsBuyFlagByUser(ShoppingListModel model) {
    return _$setIsBuyFlagByUserAsyncAction
        .run(() => super.setIsBuyFlagByUser(model));
  }

  final _$MobxFirestoreBaseActionController =
      ActionController(name: 'MobxFirestoreBase');

  @override
  CollectionReference<UserModel> getItems() {
    final _$actionInfo = _$MobxFirestoreBaseActionController.startAction(
        name: 'MobxFirestoreBase.getItems');
    try {
      return super.getItems();
    } finally {
      _$MobxFirestoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  DocumentReference<UserModel> getItemsByUserStream(
      dynamic filter, dynamic order) {
    final _$actionInfo = _$MobxFirestoreBaseActionController.startAction(
        name: 'MobxFirestoreBase.getItemsByUserStream');
    try {
      return super.getItemsByUserStream(filter, order);
    } finally {
      _$MobxFirestoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<List<ShoppingListModel>> getItemsByUserFuture() {
    final _$actionInfo = _$MobxFirestoreBaseActionController.startAction(
        name: 'MobxFirestoreBase.getItemsByUserFuture');
    try {
      return super.getItemsByUserFuture();
    } finally {
      _$MobxFirestoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
products: ${products},
filter: ${filter},
order: ${order}
    ''';
  }
}
