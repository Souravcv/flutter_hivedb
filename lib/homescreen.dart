import 'package:flutter/material.dart';

import 'db/db_function.dart';
import 'db/model.dart';

class AddstudentWidget extends StatelessWidget {
  AddstudentWidget({super.key});
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'name',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _ageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'age',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                onAddStudentButtonClick();
              },
              icon: const Icon(Icons.add),
              label: const Text('add student'),
            )
          ],
        ),
      ),
    );
  }

  Future onAddStudentButtonClick() async {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    if (name.isEmpty || age.isEmpty) {
      return;
    }
    print('$name $age');
    final student = Student(name: name, age: age);

    addstudent(student);
  }
}
