import 'package:bloc_custom/blocs/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc_custom/views/home_screen.dart';

import 'blocs/product_bloc.dart';
import 'blocs/tab_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productBloc = ProductBloc();
    final cartBloc = CartBloc();
    return MaterialApp(
        title: 'Customize Bloc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(() => TabBloc(productBloc, cartBloc)),
    );
  }
}
