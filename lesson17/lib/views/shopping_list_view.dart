import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/views/loading.dart';
import 'package:shopping_list/models/shopping_list_model.dart';
import 'package:shopping_list/observables/firestore_observable.dart';
import 'package:shopping_list/views/shopping_item_view.dart';

class ShoppingListView extends StatelessWidget {
  ShoppingListView({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final stateUser = Provider.of<MobxFirestore>(context);
    return Column(
      children: [
        Expanded(
          child: Observer(
            builder: (_) {
              return StreamBuilder<List<ShoppingListModel>?>(
                stream: stateUser
                    .getItemsByUserStream(stateUser.filter, stateUser.order)
                    .snapshots()
                    .map((event) => event.data()?.shoppingList),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const LoadingView();
                  }
                  return ListView(
                      children: stateUser.products
                          .map((e) => ShoppingItemView(item: e))
                          .toList());
                },
              );
            },
          ),
          // FutureBuilder<List<ShoppingListModel>>(
          //   future: stateUser.getItemsByUserFuture(),
          //   builder: (BuildContext context, snapshot) {
          //     if (snapshot.hasData) {
          //           return ListView(
          //               children: snapshot.data!
          //                   .map((e) => ShoppingItemView(item: e))
          //                   .toList());
          //     }
          //     return Container();
          //   },
          // )
        ),
        SizedBox(
          height: 100,
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(hintText: 'Наименование'),
                ),
              ),
              Flexible(
                flex: 1,
                child: TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(hintText: 'Кол-во'),
                  keyboardType: TextInputType.number,
                  maxLines: 2,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_nameController.text.isNotEmpty) {
                    stateUser.setItemsByUser(
                      ShoppingListModel(
                          name: _nameController.text,
                          quantity: double.tryParse(_amountController.text) ?? 1.0,
                          isBuy: false),
                    );
                    _nameController.text = '';
                    _amountController.text = '';
                  }
                },
                child: const Text('Добавить'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
