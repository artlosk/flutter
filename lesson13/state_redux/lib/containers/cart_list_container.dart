import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_redux/models/cart_product.dart';
import 'package:state_redux/states/common_state.dart';
import 'package:state_redux/views/cart_list.dart';

class CartListContainer extends StatelessWidget {
  CartListContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CommonState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return CartList(
          products: vm.products,
        );
      },
    );
  }
}

class _ViewModel {
  final List<CartProduct> products;
  final bool loading;

  _ViewModel({
    required this.products,
    required this.loading,
  });

  static _ViewModel fromStore(Store<CommonState> store) {
    return _ViewModel(
      products: store.state.cart,
      loading: store.state.isLoading,
    );
  }
}
