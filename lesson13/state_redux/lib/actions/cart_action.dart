import 'package:state_redux/actions/abstract_action.dart';
import 'package:state_redux/models/cart_product.dart';
import 'package:state_redux/models/product_data.dart';

abstract class CartAction extends Action {}

class LoadCartAction extends CartAction {}

class CartNotLoadedAction extends CartAction {}

class CartLoadedAction extends CartAction {
  final List<CartProduct> cartProducts;

  CartLoadedAction(this.cartProducts);
}

class AddProductAction extends CartAction {
  final ProductData product;

  AddProductAction(this.product);
}

class DeleteProductAction extends CartAction {
  final int id;

  DeleteProductAction(this.id);
}
