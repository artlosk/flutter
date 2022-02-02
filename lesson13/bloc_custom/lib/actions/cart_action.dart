import 'package:bloc_custom/actions/abstract_action.dart';
import 'package:bloc_custom/models/cart_product.dart';
import 'package:bloc_custom/models/product_data.dart';

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
