import 'package:layer_model/layer_model.dart';

abstract class UserService {
  Future<List<UserData>> getListUser(String assetPath);

  Future<UserData> getUser(UserData user);
}
