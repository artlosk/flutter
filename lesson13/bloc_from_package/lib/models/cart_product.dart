import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_from_package/models/product_data.dart';

part 'cart_product.freezed.dart';

part 'cart_product.g.dart';

@freezed
class CartProduct with _$CartProduct {
  factory CartProduct({
    required int qty,
    required ProductData product,
  }) = _CartProduct;

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);
}
