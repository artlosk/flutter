// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shopping_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShoppingListModel _$ShoppingListModelFromJson(Map<String, dynamic> json) {
  return _ShoppingListModel.fromJson(json);
}

/// @nodoc
class _$ShoppingListModelTearOff {
  const _$ShoppingListModelTearOff();

  _ShoppingListModel call(
      {required String name, required double quantity, required bool isBuy}) {
    return _ShoppingListModel(
      name: name,
      quantity: quantity,
      isBuy: isBuy,
    );
  }

  ShoppingListModel fromJson(Map<String, Object?> json) {
    return ShoppingListModel.fromJson(json);
  }
}

/// @nodoc
const $ShoppingListModel = _$ShoppingListModelTearOff();

/// @nodoc
mixin _$ShoppingListModel {
  String get name => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  bool get isBuy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShoppingListModelCopyWith<ShoppingListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingListModelCopyWith<$Res> {
  factory $ShoppingListModelCopyWith(
          ShoppingListModel value, $Res Function(ShoppingListModel) then) =
      _$ShoppingListModelCopyWithImpl<$Res>;
  $Res call({String name, double quantity, bool isBuy});
}

/// @nodoc
class _$ShoppingListModelCopyWithImpl<$Res>
    implements $ShoppingListModelCopyWith<$Res> {
  _$ShoppingListModelCopyWithImpl(this._value, this._then);

  final ShoppingListModel _value;
  // ignore: unused_field
  final $Res Function(ShoppingListModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? quantity = freezed,
    Object? isBuy = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      isBuy: isBuy == freezed
          ? _value.isBuy
          : isBuy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ShoppingListModelCopyWith<$Res>
    implements $ShoppingListModelCopyWith<$Res> {
  factory _$ShoppingListModelCopyWith(
          _ShoppingListModel value, $Res Function(_ShoppingListModel) then) =
      __$ShoppingListModelCopyWithImpl<$Res>;
  @override
  $Res call({String name, double quantity, bool isBuy});
}

/// @nodoc
class __$ShoppingListModelCopyWithImpl<$Res>
    extends _$ShoppingListModelCopyWithImpl<$Res>
    implements _$ShoppingListModelCopyWith<$Res> {
  __$ShoppingListModelCopyWithImpl(
      _ShoppingListModel _value, $Res Function(_ShoppingListModel) _then)
      : super(_value, (v) => _then(v as _ShoppingListModel));

  @override
  _ShoppingListModel get _value => super._value as _ShoppingListModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? quantity = freezed,
    Object? isBuy = freezed,
  }) {
    return _then(_ShoppingListModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      isBuy: isBuy == freezed
          ? _value.isBuy
          : isBuy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShoppingListModel implements _ShoppingListModel {
  _$_ShoppingListModel(
      {required this.name, required this.quantity, required this.isBuy});

  factory _$_ShoppingListModel.fromJson(Map<String, dynamic> json) =>
      _$$_ShoppingListModelFromJson(json);

  @override
  final String name;
  @override
  final double quantity;
  @override
  final bool isBuy;

  @override
  String toString() {
    return 'ShoppingListModel(name: $name, quantity: $quantity, isBuy: $isBuy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShoppingListModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.isBuy, isBuy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(isBuy));

  @JsonKey(ignore: true)
  @override
  _$ShoppingListModelCopyWith<_ShoppingListModel> get copyWith =>
      __$ShoppingListModelCopyWithImpl<_ShoppingListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShoppingListModelToJson(this);
  }
}

abstract class _ShoppingListModel implements ShoppingListModel {
  factory _ShoppingListModel(
      {required String name,
      required double quantity,
      required bool isBuy}) = _$_ShoppingListModel;

  factory _ShoppingListModel.fromJson(Map<String, dynamic> json) =
      _$_ShoppingListModel.fromJson;

  @override
  String get name;
  @override
  double get quantity;
  @override
  bool get isBuy;
  @override
  @JsonKey(ignore: true)
  _$ShoppingListModelCopyWith<_ShoppingListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
