import 'dart:async';

import 'package:bloc_from_package/actions/abstract_action.dart';
import 'package:bloc_from_package/actions/product_action.dart';
import 'package:bloc_from_package/services/product_service.dart';
import 'package:bloc_from_package/states/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<Action, ProductState> {

  ProductBloc() : super(const ProductState());

  @override
  Stream<ProductState> mapEventToState(Action event) async* {
    if (event is LoadProductAction) {
      try {
        await Future.delayed(
          const Duration(
            seconds: 1,
          ),
        );
        final list = await ProductService().getList('assets/products.json');
        yield state.copyWith(products: list, isLoading: false);
      } on Exception {
        yield state.copyWith(products: [], isLoading: false);
      }
    }
  }
}
