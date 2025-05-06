class TaskModel {
  int? id;
  String? title;
  String? description;
  String? date;

  TaskModel({this.id , 
  this.title , 
  this.description ,
   this.date}); 

   TaskModel.fromJson(Map map){
    id = map['id']; 
    title = map['title'];
    description = map['description'];
    date = map['date'];
   }

}
