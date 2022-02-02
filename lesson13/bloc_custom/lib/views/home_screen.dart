import 'package:bloc_custom/actions/cart_action.dart';
import 'package:bloc_custom/actions/product_action.dart';
import 'package:bloc_custom/actions/tab_action.dart';
import 'package:bloc_custom/blocs/tab_bloc.dart';
import 'package:bloc_custom/states/tab_state.dart';
import 'package:bloc_custom/views/cart_list.dart';
import 'package:flutter/material.dart';
import 'package:bloc_custom/models/tab_item.dart';
import 'package:bloc_custom/views/product_list.dart';

class HomeScreen extends StatefulWidget {
  final Function _blocBuilder;

  HomeScreen(this._blocBuilder);

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  late final TabBloc _bloc;

  @override
  void initState() {
    _bloc = widget._blocBuilder();
    _bloc.action.add(LoadProductAction());
    _bloc.action.add((LoadCartAction()));
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TabState>(
      stream: _bloc.state,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Загружаем данные'),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(title: Text(tabBar[snapshot.data!.activeTabIndex].title)),
            body: snapshot.data?.activeTabIndex == 0
                ? ProductList(
                    customBloc: _bloc,
                    products: snapshot.data!.productState.products
                  )
                : CartList(customBloc: _bloc, products: snapshot.data!.cartState.cartProducts),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: snapshot.data!.activeTabIndex,
              onTap: (index) {
                // context.read<TabBloc>().add(UpdateTabAction(index));
                _bloc.action.add(UpdateTabAction(index));
              },
              items: [
                for (final item in tabBar)
                  BottomNavigationBarItem(
                    label: item.title,
                    icon: item.icon,
                  ),
              ],
            ),
          );
        }
      },
    );
  }
}
