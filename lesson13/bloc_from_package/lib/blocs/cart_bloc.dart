import 'dart:async';

import 'package:bloc_from_package/actions/abstract_action.dart';
import 'package:bloc_from_package/actions/cart_action.dart';
import 'package:bloc_from_package/models/cart_product.dart';
import 'package:bloc_from_package/states/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<Action, CartState> {
  CartBloc() : super(const CartState());

  @override
  Stream<CartState> mapEventToState(Action event) async* {
    if (event is AddProductAction) {
      var _list = [...state.cartProducts];
      int qty = 1;
      if (state.isLoading) {
        _list.map((e) {
          if (e.product.id == event.product.id) {
            qty = e.qty + 1;
          }
        }).toList();
      }

      _list.removeWhere((element) => element.product.id == event.product.id);
      _list.add(CartProduct(qty: qty, product: event.product));
      yield state.copyWith(
          cartProducts: _list, totalQty: state.countTotalQty());
      state.changeTabCart();
    } else if (event is DeleteProductAction) {
      var _list = [...state.cartProducts];
      _list.removeWhere((element) => element.product.id == event.id);

      yield state.copyWith(
          cartProducts: _list, totalQty: state.countTotalQty());
      state.changeTabCart();
    }
  }
}
