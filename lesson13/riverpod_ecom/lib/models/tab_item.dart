import 'package:flutter/material.dart';

class TabItem {
  int index;
  String title;
  Icon icon;

  TabItem({required this.index, required this.title, required this.icon});
}

final List<TabItem> tabBar = [
  TabItem(index: 0, title: "Список товаров", icon: const Icon(Icons.list)),
  TabItem(index: 1, title: "Корзина", icon: const Icon(Icons.add_shopping_cart)),
];
