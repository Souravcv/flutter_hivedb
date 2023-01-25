import 'package:flutter/material.dart';
import 'db/db_function.dart';
import 'homescreen.dart';
import 'list.dart';



class Listviu extends StatelessWidget {
  const Listviu({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      body: SafeArea(
        child: Column(children:  [
          AddstudentWidget(),
          const Expanded(child: ListStudentWidget()),
          
        ]),
      ),

    );
  }
}