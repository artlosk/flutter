import 'package:freezed_annotation/freezed_annotation.dart';
part 'shopping_list_model.freezed.dart';
part 'shopping_list_model.g.dart';

@freezed
class ShoppingListModel with _$ShoppingListModel {

  factory ShoppingListModel(
      {required String name,
      required double quantity,
      required bool isBuy}) = _ShoppingListModel;

  factory ShoppingListModel.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListModelFromJson(json);

}
