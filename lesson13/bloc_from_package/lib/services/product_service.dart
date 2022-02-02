import '../models/product_data.dart';
import 'product_interface.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

//@LazySingleton(as: ProductService)
class ProductService implements ProductInterface {
  Future<List> readJsonData(String asset) async {
    final jsonData = await rootBundle.loadString(asset);
    final list = await json.decode(jsonData);
    return list;
  }

  @override
  Future<List<ProductData>> getList(String assetPath) async {
    var file = await readJsonData(assetPath);
    List<ProductData> list = file.map((e) => ProductData.fromJson(e)).toList();
    return list;
  }

  @override
  Future<ProductData> getProduct(ProductData product) async {
    return ProductData(
        id: product.id,
        title: product.title,
        description: product.description,
        image: product.image,
        price: product.price);
  }
}
