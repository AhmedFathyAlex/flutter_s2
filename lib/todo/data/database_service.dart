import 'dart:developer';

import 'package:flutter_s2/todo/data/task_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseService{
 static late final Database _tasksDb;

 static final String tableName = 'tasks';
 static final String titleCol = 'title';
 static final String descriptionCol = 'description';
 static final String dateCol = 'date';
 static final String idCol = 'id';
 
 static Future<void> initializeDb()async{
  _tasksDb = await openDatabase('tasks.db',version: 1 ,
   onCreate: (db, version) async{
    
     await db.execute(
      'CREATE TABLE $tableName ($idCol INTEGER PRIMARY KEY, $titleCol TEXT, $descriptionCol TEXT, $dateCol TEXT)');
      log('Database created');
  },
  onOpen: (db) {
    log('Database opened');
  },
  );
 }
  
  static insertTask(TaskModel task)async{
   int rowId =  await _tasksDb.rawInsert(
  'INSERT INTO $tableName($titleCol,$descriptionCol,$dateCol) VALUES("${task.title}","${task.description}","${task.date}")');
  log('row $rowId inserted successfully');
  }

  static Future<List<TaskModel>> readAllTasks()async{
    List<TaskModel> tasks = [];
   var result = await _tasksDb.rawQuery('SELECT * FROM $tableName');
   for (var element in result) {
     var model = TaskModel.fromJson(element);
     tasks.add(model);
   }
   return tasks;
  }

  static deleteTask(int id)async{
    _tasksDb.rawDelete('DELETE FROM $tableName WHERE $idCol = $id ');
  }
}