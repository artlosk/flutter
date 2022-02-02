import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_data.freezed.dart';

part 'product_data.g.dart';

@freezed
class ProductData with _$ProductData {
  factory ProductData(
      {required int id,
      required String title,
      required String description,
      required String image,
      required double price}) = _ProductData;

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);
}
