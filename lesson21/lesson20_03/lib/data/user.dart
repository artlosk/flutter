import 'package:floor/floor.dart';

@entity
class User {
  @PrimaryKey(autoGenerate: true)
  int? id;
  @ColumnInfo(name: 'first_name')
  final String firstname;
  final String lastname;
  final int age;
  final String image;
  final int phone;

  User({this.id, required this.firstname, required this.lastname, required this.age, required this.image, required this.phone});
}