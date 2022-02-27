import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_list/enums/filter.dart';
import 'package:shopping_list/enums/order.dart';
import 'package:shopping_list/models/shopping_list_model.dart';
import 'package:shopping_list/models/user_model.dart';

part 'firestore_observable.g.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class MobxFirestore = MobxFirestoreBase with _$MobxFirestore;

abstract class MobxFirestoreBase with Store {
  static const collection = 'users';

  final String userUid;

  MobxFirestoreBase({required this.userUid});

  @observable
  bool isLoading = false;

  @observable
  List<ShoppingListModel> products = [];

  @observable
  Filter filter = Filter.all;

  @observable
  Order order = Order.none;

  @action
  CollectionReference<UserModel> getItems() {
    return _firestore.collection(collection).withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  @action
  createDocIfNotExist(UserModel? model) async {
    final DocumentSnapshot<Map<String, dynamic>> doc =
        await _firestore.collection(collection).doc(model?.uid).get();
    if (!doc.exists) {
      _firestore.collection(collection).doc(model?.uid).set({
        'uid': model?.uid,
        'email': model?.email,
        'displayName': model?.displayName,
        'shoppingList': []
      });
    }
  }

  @action
  DocumentReference<UserModel> getItemsByUserStream(filter, order) {
    return _firestore
        .collection(collection)
        .doc(userUid)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) {
            products = UserModel.fromJson(snapshot.data()!).shoppingList;
            switch(filter) {
              case Filter.bought:
                products.retainWhere((element) => element.isBuy == true);
                break;
              case Filter.waiting:
                products.retainWhere((element) => element.isBuy == false);
                break;
              default:
                products = UserModel.fromJson(snapshot.data()!).shoppingList;
                break;
            }
            switch(order) {
              case Order.bought:
                products.sort((a, b) {
                  if (a.isBuy) {
                    return -1;
                  }
                  return 1;
                });
                break;
              case Order.waiting:
                products.sort((a, b) {
                  if (a.isBuy) {
                    return 1;
                  }
                  return -1;
                });
                break;
            }
            return UserModel.fromJson(snapshot.data()!);
          },
          toFirestore: (user, _) => user.toJson(),
        );
  }

  @action
  Future<List<ShoppingListModel>> getItemsByUserFuture() {
    final list = _firestore
        .collection(collection)
        .doc(userUid)
        .get()
        .then((value) => UserModel.fromJson(value.data()!).shoppingList);
    return list;
  }

  @action
  Future setItemsByUser(ShoppingListModel model) async {
    await _firestore.collection(collection).doc(userUid).set(
      {
        'shoppingList': FieldValue.arrayUnion([model.toJson()])
      },
      SetOptions(merge: true),
    );
  }

  @action
  Future deleteItemByUser(ShoppingListModel model) async {
    await _firestore
        .collection(collection)
        .doc(userUid)
        .update({
      'shoppingList': FieldValue.arrayRemove([model.toJson()]),
    });
  }

  @action
  Future deleteItemsByUser() async {
    await _firestore
        .collection(collection)
        .doc(userUid)
        .update({'shoppingList': []});
  }

  @action
  Future setIsBuyFlagByUser(ShoppingListModel model) async {
    final list = await _firestore
        .collection(collection)
        .doc(userUid)
        .get();

    final data = list.data();
    final List shoppingList = data!['shoppingList']
        .map((item) => item as Map<String, dynamic>)
        .toList();
    final Map product = shoppingList.firstWhere((item) =>
        item['name'] == model.name && item['quantity'] == model.quantity);
    product['isBuy'] = model.isBuy ? false : true;

    await _firestore.collection(collection).doc(userUid).update(data);
  }
}
