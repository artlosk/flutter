import 'package:bloc_from_package/actions/product_action.dart';
import 'package:bloc_from_package/blocs/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc_from_package/views/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/product_bloc.dart';
import 'blocs/tab_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (_) => ProductBloc()..add(LoadProductAction()),
        ),
        BlocProvider<TabBloc>(
          create: (_) => TabBloc(),
        ),
        BlocProvider<CartBloc>(
            create: (_) => CartBloc()
        ),
      ],
      child: MaterialApp(
        title: 'Bloc package flutter_bloc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
