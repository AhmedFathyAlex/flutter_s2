import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 215, 216, 221),
        borderRadius: BorderRadius.circular(10)
      ),
      child: TextField( 
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search,color: Colors.black,)
        ),
      ),
    );
  }
}