import 'dart:async';

import 'package:cubit_from_package/services/product_service.dart';
import 'package:cubit_from_package/states/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState());

  void loadProducts() async {
    try {
      await Future.delayed(
        const Duration(
          seconds: 1,
        ),
      );
      final list = await ProductService().getList('assets/products.json');
      emit(state.copyWith(products: list, isLoading: false));
    } on Exception {
      emit(state.copyWith(products: [], isLoading: false));
    }
  }
}
