import 'package:flutter/material.dart';
import 'package:flutter_s2/screens/home.dart';
import 'package:flutter_s2/screens/signin.dart';
import 'package:flutter_s2/screens/signup.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (context) => Signin(),
        '/signup' : (context) => Signup(),
        '/home' : (context) => Home(),
      },
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.cyanAccent,
        )
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/' ,
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
