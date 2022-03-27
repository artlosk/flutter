import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 0)
class Category extends HiveObject {
  @HiveField(0)
  String uuid;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  Category(this.uuid, this.title, this.description);
}