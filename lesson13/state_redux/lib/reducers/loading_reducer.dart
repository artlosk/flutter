import 'package:redux/redux.dart';
import 'package:state_redux/actions/cart_action.dart';
import 'package:state_redux/actions/product_action.dart';
import 'package:state_redux/actions/tab_action.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, TabBarsLoadedAction>(_setLoaded),
  TypedReducer<bool, TabBarsNotLoadedAction>(_setLoaded),
  TypedReducer<bool, ProductLoadedAction>(_setLoaded),
  TypedReducer<bool, ProductNotLoadedAction>(_setLoaded),
  TypedReducer<bool, CartLoadedAction>(_setLoaded),
  TypedReducer<bool, CartNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}
