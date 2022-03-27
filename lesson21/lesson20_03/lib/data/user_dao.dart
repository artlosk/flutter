import 'package:floor/floor.dart';
import 'package:lesson20_03/data/user.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM User')
  Future<List<User>> findAllUsers();

  @Query('SELECT * FROM User WHERE id = :id')
  Stream<User?> findUserById(int id);

  @insert
  Future<int> insertUser(User user);

  @delete
  Future<void> deleteUser(User user);

  @update
  Future<void> updateUser(User user);

  @Query('SELECT id FROM User ORDER BY id DESC LIMIT 1')
  Future<int?> getLastId();
}