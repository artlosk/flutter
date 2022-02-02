import 'dart:async';

import 'package:bloc_custom/actions/abstract_action.dart';
import 'package:bloc_custom/actions/cart_action.dart';
import 'package:bloc_custom/actions/product_action.dart';
import 'package:bloc_custom/actions/tab_action.dart';
import 'package:bloc_custom/blocs/product_bloc.dart';
import 'package:bloc_custom/states/tab_state.dart';

import 'cart_bloc.dart';

class TabBloc {
  final ProductBloc productBloc;
  final CartBloc cartBloc;

  var _currentState = TabState();

  final _stateController = StreamController<TabState>();
  final _actionsController = StreamController<Action>();

  Stream<TabState> get state => _stateController.stream;
  Sink<Action> get action => _actionsController.sink;

  TabBloc(this.productBloc, this.cartBloc) {
    productBloc.state.listen((state) {
      _currentState = _currentState.copyWith(productState: state);
      _stateController.add(_currentState);
    });
    cartBloc.state.listen((state) {
      _currentState = _currentState.copyWith(cartState: state);
      _stateController.add(_currentState);
    });
    _actionsController.stream.listen((action) {
      if (action is UpdateTabAction) {
        _currentState = _currentState.copyWith(activeTabIndex: action.newTab);
        _stateController.add(_currentState);
      } else if (action is ProductAction) {
        productBloc.action.add(action);
      } else if (action is CartAction) {
        cartBloc.action.add(action);
      }
    });
  }

  void dispose() {
    productBloc.dispose();
    cartBloc.dispose();
    _stateController.close();
    _actionsController.close();
  }
}
