import 'dart:async';

import 'package:bloc_custom/actions/abstract_action.dart';
import 'package:bloc_custom/actions/product_action.dart';
import 'package:bloc_custom/services/product_service.dart';
import 'package:bloc_custom/states/product_state.dart';

class ProductBloc {
  var _currentState = const ProductState();

  final _stateController = StreamController<ProductState>();
  final _actionsController = StreamController<Action>();

  Stream<ProductState> get state => _stateController.stream;
  Sink<Action> get action => _actionsController.sink;

  ProductBloc() {
    _actionsController.stream.listen(_handleAction);
  }

  void dispose() {
    _stateController.close();
    _actionsController.close();
  }

  void _handleAction(Action action) async {
    if (action is LoadProductAction) {
      try {
        await Future.delayed(
          const Duration(
            seconds: 1,
          ),
        );
        final list = await ProductService().getList('assets/products.json');
        _currentState = _currentState.copyWith(products: list);
      } on Exception {
        _currentState = _currentState.copyWith(products: []);
      }
    }
    _stateController.add(_currentState);
  }
}
