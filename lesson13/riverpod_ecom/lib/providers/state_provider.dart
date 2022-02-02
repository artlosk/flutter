import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_ecom/models/cart_product.dart';
import 'package:riverpod_ecom/models/product_data.dart';
import 'package:riverpod_ecom/models/tab_item.dart';
import 'package:riverpod_ecom/notifiers/notifier.dart';
import 'package:riverpod_ecom/services/product_service.dart';

final List<ProductData> products = [];
final productsProvider =
    StateNotifierProvider<ProductNotifier, List<ProductData>>((_) {
  return ProductNotifier(const ProductService());
});

final cartProvider = StateNotifierProvider<CartNotifier, List<CartProduct>>((ref) {
  return CartNotifier();
});

final tabProvider = StateProvider((_) => tabBar[0]);

final loadingProvider = Provider((ref) => ref
    .watch(productsProvider)
    .isNotEmpty /* && ref.watch(cartProvider).isNotEmpty*/);
