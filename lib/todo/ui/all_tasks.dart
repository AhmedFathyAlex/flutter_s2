import 'package:flutter/material.dart';
import 'package:flutter_s2/todo/data/database_service.dart';
import 'package:flutter_s2/todo/data/task_model.dart';
import 'package:flutter_s2/todo/ui/task_card.dart';
import 'package:flutter_s2/widgets/custom_text_field.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({super.key});

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  final titleC = TextEditingController();
  final dateC = TextEditingController();
  final descC = TextEditingController();
  
  List<TaskModel> tasks = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   _readTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){

        showModalBottomSheet(context: context, builder: (context){
          return Container(width: double.infinity,color: Colors.tealAccent,
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(hint: 'task title', controller: titleC,),
              CustomTextField(hint: 'task description', controller: descC,),
              CustomTextField(hint: 'task date', controller: dateC,),
              ElevatedButton(onPressed: (){
               var model = TaskModel(
                title: titleC.text, 
                description: descC.text,
                date: dateC.text
               );
           DatabaseService.insertTask(model);
           _readTasks();
                titleC.clear();
                descC.clear();
                dateC.clear();
                Navigator.pop(context);
              }, child: Text('Save'))
            ],
          ),);
        });

      }  , child: Icon(Icons.add), ),
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

  _readTasks()async{
  var results = await  DatabaseService.readAllTasks();
  setState(() {
    tasks = results;
  });
  }
}