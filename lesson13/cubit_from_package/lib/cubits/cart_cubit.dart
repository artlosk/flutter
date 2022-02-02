import 'package:cubit_from_package/models/cart_product.dart';
import 'package:cubit_from_package/models/product_data.dart';
import 'package:cubit_from_package/states/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  void addProduct(ProductData product) {
    var _list = [...state.cartProducts];
    int qty = 1;
    if (state.isLoading) {
      _list.map((e) {
        if (e.product.id == product.id) {
          qty = e.qty + 1;
        }
      }).toList();
    }

    _list.removeWhere((element) => element.product.id == product.id);
    _list.add(CartProduct(qty: qty, product: product));
    emit(state.copyWith(
        cartProducts: _list, totalQty: state.countTotalQty()));
    state.changeTabCart();
  }

  void deleteProduct(int id) {
    var _list = [...state.cartProducts];
    _list.removeWhere((element) => element.product.id == id);

    emit(state.copyWith(
        cartProducts: _list, totalQty: state.countTotalQty()));
    state.changeTabCart();
  }
}

