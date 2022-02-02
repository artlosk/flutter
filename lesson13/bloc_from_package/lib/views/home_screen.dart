import 'package:bloc_from_package/actions/tab_action.dart';
import 'package:bloc_from_package/blocs/cart_bloc.dart';
import 'package:bloc_from_package/blocs/product_bloc.dart';
import 'package:bloc_from_package/blocs/tab_bloc.dart';
import 'package:bloc_from_package/models/cart_product.dart';
import 'package:bloc_from_package/states/tab_state.dart';
import 'package:bloc_from_package/states/cart_state.dart';
import 'package:bloc_from_package/views/cart_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc_from_package/models/tab_item.dart';
import 'package:bloc_from_package/states/product_state.dart';
import 'package:bloc_from_package/views/product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  //BlocBuilder<UiBloc, AppState>(
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, productState) {
        if (productState.isLoading) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Загружаем данные'),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return BlocBuilder<CartBloc, CartState>(
            builder: (context, cartState) {
              return BlocBuilder<TabBloc, TabState>(
                builder: (context, tabState) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text(tabBar[tabState.activeTabIndex].title)
                    ),
                    body: tabState.activeTabIndex == 0
                        ? ProductList(
                            products: productState.products,
                          )
                        : CartList(products: cartState.cartProducts),
                    bottomNavigationBar: BottomNavigationBar(
                      currentIndex: tabState.activeTabIndex,
                      onTap: (index) {
                        context.read<TabBloc>().add(UpdateTabAction(index));
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
                },
              );
            },
          );
        }
      },
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   String _title = '';
//   static const routeName = '/';
//
//   HomeScreen();
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ProductState>(builder: (context, state, child) {
//       if (!state.isLoaded) {
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text('Загружаем данные'),
//           ),
//           body: const Center(
//             child: CircularProgressIndicator(),
//           ),
//         );
//       } else {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text(state.appBarTitle),
//           ),
//           body: state.activeTabIndex == 0
//               ? ProductList(products: state.products)
//               // : CartList(products: state.cartProducts),
//               : Container(),
//           bottomNavigationBar: BottomNavigationBar(
//             currentIndex: state.activeTabIndex,
//             onTap: (index) {
//               state.updateTab(index);
//               _title = state.appBarTitle;
//             },
//             items: [
//               for (final item in tabBar)
//                 BottomNavigationBarItem(
//                   label: item.title,
//                   icon: item.icon,
//                 )
//             ],
//           ),
//         );
//       }
//     });
//   }
// }
