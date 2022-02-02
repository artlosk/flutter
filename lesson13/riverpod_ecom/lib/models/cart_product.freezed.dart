// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartProduct _$CartProductFromJson(Map<String, dynamic> json) {
  return _CartProduct.fromJson(json);
}

/// @nodoc
class _$CartProductTearOff {
  const _$CartProductTearOff();

  _CartProduct call({required int qty, required ProductData product}) {
    return _CartProduct(
      qty: qty,
      product: product,
    );
  }

  CartProduct fromJson(Map<String, Object?> json) {
    return CartProduct.fromJson(json);
  }
}

/// @nodoc
const $CartProduct = _$CartProductTearOff();

/// @nodoc
mixin _$CartProduct {
  int get qty => throw _privateConstructorUsedError;
  ProductData get product => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartProductCopyWith<CartProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartProductCopyWith<$Res> {
  factory $CartProductCopyWith(
          CartProduct value, $Res Function(CartProduct) then) =
      _$CartProductCopyWithImpl<$Res>;
  $Res call({int qty, ProductData product});

  $ProductDataCopyWith<$Res> get product;
}

/// @nodoc
class _$CartProductCopyWithImpl<$Res> implements $CartProductCopyWith<$Res> {
  _$CartProductCopyWithImpl(this._value, this._then);

  final CartProduct _value;
  // ignore: unused_field
  final $Res Function(CartProduct) _then;

  @override
  $Res call({
    Object? qty = freezed,
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductData,
    ));
  }

  @override
  $ProductDataCopyWith<$Res> get product {
    return $ProductDataCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc
abstract class _$CartProductCopyWith<$Res>
    implements $CartProductCopyWith<$Res> {
  factory _$CartProductCopyWith(
          _CartProduct value, $Res Function(_CartProduct) then) =
      __$CartProductCopyWithImpl<$Res>;
  @override
  $Res call({int qty, ProductData product});

  @override
  $ProductDataCopyWith<$Res> get product;
}

/// @nodoc
class __$CartProductCopyWithImpl<$Res> extends _$CartProductCopyWithImpl<$Res>
    implements _$CartProductCopyWith<$Res> {
  __$CartProductCopyWithImpl(
      _CartProduct _value, $Res Function(_CartProduct) _then)
      : super(_value, (v) => _then(v as _CartProduct));

  @override
  _CartProduct get _value => super._value as _CartProduct;

  @override
  $Res call({
    Object? qty = freezed,
    Object? product = freezed,
  }) {
    return _then(_CartProduct(
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartProduct implements _CartProduct {
  _$_CartProduct({required this.qty, required this.product});

  factory _$_CartProduct.fromJson(Map<String, dynamic> json) =>
      _$$_CartProductFromJson(json);

  @override
  final int qty;
  @override
  final ProductData product;

  @override
  String toString() {
    return 'CartProduct(qty: $qty, product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartProduct &&
            const DeepCollectionEquality().equals(other.qty, qty) &&
            const DeepCollectionEquality().equals(other.product, product));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(qty),
      const DeepCollectionEquality().hash(product));

  @JsonKey(ignore: true)
  @override
  _$CartProductCopyWith<_CartProduct> get copyWith =>
      __$CartProductCopyWithImpl<_CartProduct>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartProductToJson(this);
  }
}

abstract class _CartProduct implements CartProduct {
  factory _CartProduct({required int qty, required ProductData product}) =
      _$_CartProduct;

  factory _CartProduct.fromJson(Map<String, dynamic> json) =
      _$_CartProduct.fromJson;

  @override
  int get qty;
  @override
  ProductData get product;
  @override
  @JsonKey(ignore: true)
  _$CartProductCopyWith<_CartProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
