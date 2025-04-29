import 'package:flutter/material.dart';
import 'package:flutter_s2/todo/data/task_model.dart';
import 'package:flutter_s2/todo/ui/task_card.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({super.key});

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {

  List<TaskModel> tasks = [
    TaskModel(title: 'test 1' , description: 'first task' , date: '1-1'),
    TaskModel(title: 'test 2' , description: 'second task' , date: '2-1'),
    TaskModel(title: 'test 3' , description: 'third task' , date: '3-1'),
    TaskModel(title: 'test 3' , description: 'third task' , date: '3-1'),
    TaskModel(title: 'test 3' , description: 'third task' , date: '3-1'),
    TaskModel(title: 'test 3' , description: 'third task' , date: '3-1'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Tasks'),),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: ListView.builder(itemBuilder: (context,index){
            return TaskCard(taskModel: tasks[index]);
          }, 
          itemCount: tasks.length,),
        ),
      ),
    );
  }
}