import 'package:flutter/services.dart';
import 'dart:convert';

Future<String> fetchFileFromAssets(String assetsPath) async {
  return rootBundle.loadString(assetsPath).then((file) => file);
}

Future<List> ReadJsonData(String asset) async {
  final jsonData = await rootBundle.loadString(asset);
  final list = await json.decode(jsonData);
  return list;
}
