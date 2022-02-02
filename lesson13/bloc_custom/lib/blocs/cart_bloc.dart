import 'dart:async';

import 'package:bloc_custom/actions/abstract_action.dart';
import 'package:bloc_custom/actions/cart_action.dart';
import 'package:bloc_custom/models/cart_product.dart';
import 'package:bloc_custom/states/cart_state.dart';

class CartBloc {
  var _currentState = const CartState();

  final _stateController = StreamController<CartState>();
  final _actionsController = StreamController<Action>();

  Stream<CartState> get state => _stateController.stream;
  Sink<Action> get action => _actionsController.sink;

  CartBloc() {
    _actionsController.stream.listen(handleAction);
  }

  void dispose() {
    _stateController.close();
    _actionsController.close();
  }

  void handleAction(Action action) async {
    if (action is LoadCartAction) {
      await Future.delayed(
        const Duration(
          seconds: 1,
        ),
      );
      _currentState = _currentState.copyWith(totalQty: 0, cartProducts: []);
    } else if (action is AddProductAction) {
      var _list = [..._currentState.cartProducts];
      int qty = 1;
      if (_currentState.isLoading) {
        _list.map((e) {
          if (e.product.id == action.product.id) {
            qty = e.qty + 1;
          }
        }).toList();
      }

      _list.removeWhere((element) => element.product.id == action.product.id);
      _list.add(CartProduct(qty: qty, product: action.product));
      _currentState = _currentState.copyWith(
          cartProducts: _list, totalQty: _currentState.countTotalQty());
      _currentState.changeTabCart();
    } else if (action is DeleteProductAction) {
      var _list = [..._currentState.cartProducts];
      _list.removeWhere((element) => element.product.id == action.id);

      _currentState = _currentState.copyWith(
          cartProducts: _list, totalQty:_currentState.countTotalQty());
      _currentState.changeTabCart();
    }
    _stateController.add(_currentState);
  }
}
