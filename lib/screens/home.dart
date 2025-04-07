import 'package:flutter/material.dart';
import 'package:flutter_s2/screens/signin.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
          actions: [
            IconButton(onPressed: (){
              print('Notification clicked');
            },
             icon: Icon(Icons.notification_add),),
            IconButton(onPressed: (){
                print('home clicked');
            }, icon: Icon(Icons.home)),
            IconButton(onPressed: (){
              print('Profile Clicked');
            }, icon: Icon(Icons.person),)
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Text('Hello',style: TextStyle(fontSize: 25,color: Colors.blue),),
              Text('Ahmed Fathy',style: TextStyle(fontSize: 30,color: Colors.blue,fontWeight: FontWeight.bold)),
              Text('Flutter Developer',style: TextStyle(fontSize: 20,color: Colors.red,fontStyle: FontStyle.italic)),
              SizedBox(height: 20,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Icon(Icons.person_add),
                    SizedBox(width: 20,),
                    Icon(Icons.message),
                    SizedBox(width: 20,),
                    Icon(Icons.call),
                     Icon(Icons.person_add),
                    SizedBox(width: 20,),
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }
}