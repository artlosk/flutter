import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_redux/actions/product_action.dart';
import 'package:flutter/material.dart';
import 'package:state_redux/actions/tab_action.dart';
import 'package:state_redux/reducers/common_reducer.dart';
import 'package:state_redux/states/common_state.dart';
import 'package:state_redux/views/home_screen.dart';

import 'actions/cart_action.dart';
import 'middlewares/store_middleware.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = Store<CommonState>(
    appReducer,
    initialState: CommonState.loading(),
    middleware: createStoreMiddleware(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CommonState>(
      store: store,
      child: MaterialApp(
        title: 'State package Redux',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          "/": (context) {
            return HomeScreen(
              onInit: () {
                StoreProvider.of<CommonState>(context)
                    .dispatch(LoadTabBarsAction());
                StoreProvider.of<CommonState>(context)
                    .dispatch(LoadProductAction());
                StoreProvider.of<CommonState>(context)
                    .dispatch(LoadCartAction());
              },
            );
          },
        },
      ),
    );
  }
}
