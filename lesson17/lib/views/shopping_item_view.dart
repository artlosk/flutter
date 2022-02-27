import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/models/shopping_list_model.dart';

import '../observables/firestore_observable.dart';

class ShoppingItemView extends StatelessWidget {
  ShoppingItemView({Key? key, required this.item}) : super(key: key);

  final ShoppingListModel item;

  final List<String> _chips = [
    'ожидание',
    'куплено',
  ];

  @override
  Widget build(BuildContext context) {
    final stateUser = Provider.of<MobxFirestore>(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: Text(
                    item.name,
                    style: const TextStyle(fontSize: 14),
                  ),
                  padding: const EdgeInsets.all(5),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      item.quantity.toString(),
                      style: const TextStyle(fontSize: 14),
                    ),
                    padding: const EdgeInsets.all(10),
                  )),
              Expanded(
                flex: 2,
                child: ActionChip(
                  labelPadding: const EdgeInsets.all(3.0),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey.shade600,
                    child: item.isBuy
                        ? Text(
                            _chips[1][0].toUpperCase(),
                            style: const TextStyle(fontSize: 12),
                          )
                        : Text(_chips[0][0].toUpperCase(),
                            style: const TextStyle(fontSize: 12)),
                  ),
                  label: Text(
                    item.isBuy ? _chips[1] : _chips[0],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: item.isBuy
                      ? const Color(0xFF4db6ac)
                      : const Color(0xFFff8a65),
                  elevation: 6.0,
                  // shadowColor: Colors.grey[60],
                  padding: const EdgeInsets.all(6.0),
                  onPressed: () {
                    stateUser.setIsBuyFlagByUser(item);
                  },
                ),
              ),
              Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      stateUser.deleteItemByUser(item);
                      //stateUser.deleteItemsByUser();
                    },
                    color: Colors.red.shade700,
                    icon: const Icon(
                      Icons.delete_forever_rounded,
                      size: 24,
                    ),
                    //height: 30,
                  ))
            ],
          ),
        ),
        const Divider(
          thickness: 2,
        )
      ],
    );
  }
}
