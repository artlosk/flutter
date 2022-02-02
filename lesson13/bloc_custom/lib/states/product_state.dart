import 'package:bloc_custom/models/product_data.dart';

class ProductState {
  final List<ProductData> products;
  final bool isLoading;

  const ProductState({
    this.products = const [],
    this.isLoading = true,
  });

  ProductState copyWith({
    List<ProductData>? products,
    bool? isLoading,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ProductState &&
              runtimeType == other.runtimeType &&
              isLoading == other.isLoading &&
              products == other.products;

  @override
  int get hashCode => products.hashCode ^ isLoading.hashCode;

  @override
  String toString() => 'ProductState{products: $products, isLoading: $isLoading}';
}
