import 'package:flutter/material.dart';
import 'package:flutter_s2/ecommerce/presentation/screens/all_products.dart';
import 'package:flutter_s2/screens/signin.dart';
import 'package:flutter_s2/todo/ui/all_tasks.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
 bool isLogin = false;
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  var token = sp.getString('token');

  if(token != null){
    isLogin = true;
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.cyanAccent,
        )
      ),
      debugShowCheckedModeBanner: false,
      home: AllTasks()
    );
  }
}

// MaterialApp (root widget of all the apps) [home - debugShowCheckedModeBanner]
// Scaffold [body - appBar - floatingActionButton]
// Text [data - style]
// SafeArea [child]
// Center [child]
// AppBar [backgroundColor - title - actions - leading]
// Icon
// IconButton
// SizedBox
// Column [children]
// Row [children]
// TextStyle [fontSize - color - fontWeight - fontStyle]
// Text Field
// reusable widget
// padding
// Image
// single Child scroll view
// anonymous Navigation
// named navigation
//Container
// Expanded
// Shared prefrences 
