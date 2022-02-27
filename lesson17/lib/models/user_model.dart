import 'package:freezed_annotation/freezed_annotation.dart';
import 'shopping_list_model.dart';

part 'user_model.g.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  // final String uid;
  // final String email;
  // final String displayName;
  // final List<ShoppingListModel> shoppingList;

  factory UserModel(
      {required String uid,
      required String email,
      required String displayName,
      @Default([]) List<ShoppingListModel> shoppingList}) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
