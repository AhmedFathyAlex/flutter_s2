import 'package:flutter/material.dart';
import 'package:flutter_s2/home.dart';
import 'package:flutter_s2/signin.dart';

void main() {
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
      home: Signin() ,
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
