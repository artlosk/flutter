// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShoppingListModel _$$_ShoppingListModelFromJson(Map<String, dynamic> json) =>
    _$_ShoppingListModel(
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      isBuy: json['isBuy'] as bool,
    );

Map<String, dynamic> _$$_ShoppingListModelToJson(
        _$_ShoppingListModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'isBuy': instance.isBuy,
    };
