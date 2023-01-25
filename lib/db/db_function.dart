import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model.dart';

ValueNotifier<List<Student>> studentListNotifier = ValueNotifier([]);

Future<void> addstudent(Student value) async {
  final studentDB = await Hive.openBox<Student>('student_db');
  final id = await studentDB.add(value);
  value.id = id;

  studentListNotifier.value.add(value);
//  print(value.toString());
  studentListNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<Student>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deletStudent(int id) async {
  final studentDB = await Hive.openBox<Student>('student_db');
  await studentDB.delete(id);
  getAllStudents();
}
