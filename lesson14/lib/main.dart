import 'package:flutter/material.dart';
import 'package:lesson14/initial_size.dart';
import 'package:lesson14/themes.dart';
import 'custom_theme.dart';

void main() {
  runApp(
    const CustomTheme(
      initialThemeKey: MyThemeKeys.Day,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lesson 14',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.of(context),
      home: const InitialSize(),
    );
  }
}