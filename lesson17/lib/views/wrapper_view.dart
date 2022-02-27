import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/enums/filter.dart';
import 'package:shopping_list/enums/order.dart';
import 'package:shopping_list/views/loading.dart';
import 'package:shopping_list/observables/firestore_observable.dart';
import 'package:shopping_list/views/shopping_list_view.dart';

import '../models/user_model.dart';
import '../observables/auth_observable.dart';

class WrapperView extends StatelessWidget {
  WrapperView({Key? key}) : super(key: key);

  final storage = FirebaseStorage.instance;

  static const String nameBackground = 'background_shopping_list.jpg';

  @override
  Widget build(BuildContext context) {
    final stateAuth = Provider.of<AuthState>(context);
    final stateUser = Provider.of<MobxFirestore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список покупок'),
        actions: <Widget>[
          Observer(
            builder: (_) {
              return PopupMenuButton(
                icon: const Icon(Icons.remove_red_eye),
                onSelected: (result) {
                  switch (result) {
                    case Filter.all:
                      stateUser.filter = Filter.all;
                      break;
                    case Filter.bought:
                      stateUser.filter = Filter.bought;
                      break;
                    case Filter.waiting:
                      stateUser.filter = Filter.waiting;
                      break;
                    default:
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  const PopupMenuItem(
                    value: Filter.all,
                    child: Text('Все'),
                  ),
                  const PopupMenuItem(
                    value: Filter.bought,
                    child: Text('Куплено'),
                  ),
                  const PopupMenuItem(
                    value: Filter.waiting,
                    child: Text('В ожидание'),
                  ),
                ],
              );
            },
          ),
          Observer(
            builder: (_) {
              return PopupMenuButton(
                icon: const Icon(Icons.filter_list_alt),
                onSelected: (result) {
                  switch (result) {
                    case Order.none:
                      stateUser.order = Order.none;
                      break;
                    case Order.bought:
                      stateUser.order = Order.bought;
                      break;
                    case Order.waiting:
                      stateUser.order = Order.waiting;
                      break;
                    default:
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  const PopupMenuItem(
                    value: Order.none,
                    child: Text('По умолчанию'),
                  ),
                  const PopupMenuItem(
                    value: Order.bought,
                    child: Text('Куплено'),
                  ),
                  const PopupMenuItem(
                    value: Order.waiting,
                    child: Text('В ожидание'),
                  ),
                ],
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              stateUser.deleteItemsByUser();
            },
            child: const Text('Очистить все'),
          ),
          IconButton(
            onPressed: () {
              stateAuth.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: FutureBuilder<UserModel>(
        future: stateAuth.currentUser(),
        builder: (context, snapshotUser) {
          if (snapshotUser.hasData && snapshotUser.data != null) {
            stateUser.createDocIfNotExist(snapshotUser.data!);
            return FutureBuilder<String>(
              future: storage.ref(nameBackground).getDownloadURL(),
              builder: (context, snapshotImage) {
                if (snapshotImage.connectionState == ConnectionState.waiting) {
                  return const LoadingView();
                }
                if (snapshotImage.hasData || snapshotImage.data != null) {
                  return DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(snapshotImage.data!),
                          fit: BoxFit.cover,
                          opacity: 0.1,
                        ),
                      ),
                      child: ShoppingListView());
                }
                return ShoppingListView();
              },
            );
          }
          return const LoadingView();
        },
      ),
    );
  }
}
