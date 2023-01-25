import 'package:hive/hive.dart';
import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 1)
class Student {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String age;
  Student({required this.name, required this.age, this.id});
}
