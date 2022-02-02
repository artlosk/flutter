import 'package:bloc_from_package/actions/abstract_action.dart';
import 'package:bloc_from_package/models/product_data.dart';

abstract class ProductAction extends Action {}

class LoadProductAction extends ProductAction {}

class ProductNotLoadedAction extends ProductAction {}

class ProductLoadedAction extends ProductAction {
  final List<ProductData> products;

  ProductLoadedAction(this.products);
}
