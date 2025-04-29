import 'package:flutter/material.dart';
import 'package:flutter_s2/todo/data/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskModel.title!),
      subtitle: Text(taskModel.description!),
      trailing: CircleAvatar(radius: 30,backgroundColor: Colors.tealAccent,child: Text(taskModel.date!),),
    );
  }
}