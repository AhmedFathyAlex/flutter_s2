import 'package:flutter/material.dart';

class Flag extends StatelessWidget {
  const Flag({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container(color: Colors.red,width: double.infinity)),
            Expanded(child: Container(color: Colors.grey,width: double.infinity,)),
            Expanded(child: Container(color: Colors.black,width: double.infinity,)),
          ],
        ),
      ),
    );
  }
}