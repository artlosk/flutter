import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_redux/models/product_data.dart';
import 'package:state_redux/models/tab_item.dart';
import 'package:state_redux/states/common_state.dart';
import 'package:state_redux/views/product_list.dart';

class ProductListContainer extends StatelessWidget {
  ProductListContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CommonState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return ProductList(
          products: vm.products,
        );
      },
    );
  }
}

class _ViewModel {
  final List<ProductData> products;
  final List<TabItem> tabs;
  final bool loading;

  _ViewModel({
    required this.products,
    required this.tabs,
    required this.loading,
  });

  static _ViewModel fromStore(Store<CommonState> store) {
    return _ViewModel(
      products: store.state.products,
      loading: store.state.isLoading,
      tabs: store.state.tabs,
    );
  }
}
