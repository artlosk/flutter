import 'package:flutter/material.dart';

class TabItem {
  String title;
  Icon icon;

  TabItem({required this.title, required this.icon});
}

final List<TabItem> tabBar = [
  TabItem(title: "Список товаров", icon: const Icon(Icons.list)),
  TabItem(title: "Корзина", icon: const Icon(Icons.add_shopping_cart)),
];
