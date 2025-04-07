import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.controller,
    this.onValidate
  });

  final String hint;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? onValidate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        validator: onValidate,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
