import 'package:cubit_from_package/cubits/cart_cubit.dart';
import 'package:cubit_from_package/cubits/product_cubit.dart';
import 'package:cubit_from_package/cubits/tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:cubit_from_package/views/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductCubit>(
          create: (_) => ProductCubit()..loadProducts(),
        ),
        BlocProvider<TabCubit>(
          create: (_) => TabCubit(),
        ),
        BlocProvider<CartCubit>(
            create: (_) => CartCubit()
        ),
      ],
      child: MaterialApp(
        title: 'Cubit package flutter_bloc',
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
