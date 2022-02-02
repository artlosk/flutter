import '../models/product_data.dart';

abstract class ProductInterface {
  const ProductInterface();

  Future<List<ProductData>> getList(String assetPath);

  Future<ProductData> getProduct(ProductData product);
}
