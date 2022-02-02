import 'package:redux/redux.dart';
import 'package:state_redux/actions/cart_action.dart';
import 'package:state_redux/models/cart_product.dart';

final cartReducer = combineReducers<List<CartProduct>>([
  TypedReducer<List<CartProduct>, AddProductAction>(_addProduct),
  TypedReducer<List<CartProduct>, DeleteProductAction>(_deleteProduct),
]);

List<CartProduct> _addProduct(List<CartProduct> cart, AddProductAction action) {
  var _list = [...cart];
  int qty = 1;
  _list.map((e) {
    if (e.product.id == action.product.id) {
      qty = e.qty + 1;
    }
  }).toList();

  _list.removeWhere((element) => element.product.id == action.product.id);
  _list.add(CartProduct(qty: qty, product: action.product));

  cart = _list;
  return cart;
}

List<CartProduct> _deleteProduct(
    List<CartProduct> cart, DeleteProductAction action) {
  var _list = [...cart];
  _list.removeWhere((element) => element.product.id == action.id);
  cart = _list;
  return cart;
}
