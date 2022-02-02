import 'package:state_redux/reducers/cart_reducer.dart';
import 'package:state_redux/reducers/product_reducer.dart';
import 'package:state_redux/reducers/tab_reducer.dart';
import 'package:state_redux/states/common_state.dart';

import 'loading_reducer.dart';

CommonState appReducer(CommonState state, action) {
  return CommonState(
      isLoading: loadingReducer(state.isLoading, action),
      tabs: tabsReducer(state.tabs, action),
      products: productReducer(state.products, action),
      cart: cartReducer(state.cart, action),
      activeTab: tabsIndexReducer(state.activeTab, action),
  );
}
