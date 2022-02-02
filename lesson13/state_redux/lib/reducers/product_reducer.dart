import 'package:redux/redux.dart';
import 'package:state_redux/actions/product_action.dart';
import 'package:state_redux/models/product_data.dart';

final productReducer = combineReducers<List<ProductData>>([
  TypedReducer<List<ProductData>, ProductLoadedAction>(_setLoadedProducts),
]);

List<ProductData> _setLoadedProducts(List<ProductData> products, ProductLoadedAction action) {
  return action.products;
}