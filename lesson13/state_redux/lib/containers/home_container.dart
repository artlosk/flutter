import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_redux/containers/product_list_container.dart';
import 'package:state_redux/models/product_data.dart';
import 'package:state_redux/models/tab_item.dart';
import 'package:state_redux/states/common_state.dart';

import 'bottom_navigate_container.dart';
import 'cart_list_container.dart';

class HomeContainer extends StatelessWidget {
  HomeContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CommonState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(
            title: Text(vm.tabs[vm.activeTab].title),
          ),
          body:
              vm.activeTab == 0 ? ProductListContainer() : CartListContainer(),
          bottomNavigationBar: BottomNavigateContainer(),
        );
      },
    );
  }
}

class _ViewModel {
  final List<ProductData> products;
  final List<TabItem> tabs;
  final int activeTab;
  final bool loading;

  _ViewModel({
    required this.products,
    required this.tabs,
    required this.activeTab,
    required this.loading,
  });

  static _ViewModel fromStore(Store<CommonState> store) {
    return _ViewModel(
      products: store.state.products,
      loading: store.state.isLoading,
      activeTab: store.state.activeTab,
      tabs: store.state.tabs,
    );
  }
}
