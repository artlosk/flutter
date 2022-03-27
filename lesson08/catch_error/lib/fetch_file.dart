import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<String> fetchFileFromAssets(String assetsPath) async {
  return rootBundle.loadString(assetsPath).then((file) {
    return file.toString();
  }).catchError((error) {
    throw FlutterError('File not found');
  });
}
