import 'package:flutter/material.dart';
import 'package:flutter_broto/db/model.dart';
import 'db/db_function.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(                                      
      valueListenable: studentListNotifier,
      builder:(BuildContext ctx,List<Student> studentList,Widget? child){
        return
        ListView.separated(
        itemBuilder: (ctx, index){
          final data = studentList[index];
          return ListTile(
            title: Text(data.name),
            subtitle: Text(data.age),
            leading: const CircleAvatar(
              backgroundImage:NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0NCT9X-reMI7mXgyoARYp6UPOPlM44tFyyQ&usqp=CAU') ,
            ),
            trailing: IconButton(onPressed: (){
              if(data.id !=null){
                            deletStudent(data.id!);
              }else{
                print('student id is null');
              }
            },
             icon: const Icon(Icons.delete,color: Color.fromARGB(255, 54, 89, 244),)),
    
          );
          
        } ,
        separatorBuilder: (ctx,index){
          return const Divider();
        },
        itemCount: studentList.length,
      );

      },
       
    );
  }
}