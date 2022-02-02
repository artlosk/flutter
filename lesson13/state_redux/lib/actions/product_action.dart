import 'package:state_redux/actions/abstract_action.dart';
import 'package:state_redux/models/product_data.dart';

abstract class ProductAction extends Action {}

class LoadProductAction extends ProductAction {}

class ProductNotLoadedAction extends ProductAction {}

class ProductLoadedAction extends ProductAction {
  final List<ProductData> products;

  ProductLoadedAction(this.products);
}
