import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             ElevatedButton(
              onPressed: () {
                setState(() {
                  if(counter > 0)
                  counter--;
                });
              },
              child: Icon(Icons.remove),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Counter : $counter'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
