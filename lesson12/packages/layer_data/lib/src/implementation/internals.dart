import 'package:injectable/injectable.dart';
import 'package:layer_data/src/api/services.dart';
import 'package:layer_model/layer_model.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

@LazySingleton(as: UserService)
class DummyUserService implements UserService {

  Future<List> readJsonData(String asset) async {
    final jsonData = await rootBundle.loadString(asset);
    final list = await json.decode(jsonData);
    return list;
  }

  @override
  Future<List<UserData>> getListUser(String assetPath) async {
    //var list = parseJsonFromAssets(pathAsset);
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    var file = await readJsonData(assetPath);
    List<UserData> listUser = file.map((e) => UserData.fromJson(e)).toList();
    return listUser;
  }

  @override
  Future<UserData> getUser(UserData user) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return UserData(id: user.id, firstname: user.firstname, lastname: user.lastname, email: user.email, bio: user.bio);
  }
}
