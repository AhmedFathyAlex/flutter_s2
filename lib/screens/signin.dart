import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_s2/ecommerce/presentation/screens/all_products.dart';
import 'package:flutter_s2/widgets/custom_text_field.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Signin extends StatelessWidget {
  Signin({super.key});
  var emailC = TextEditingController();
  var passwordC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign in')),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/login.jpg', width: 300),
                CustomTextField(
                  hint: 'Email',
                  controller: emailC,
                  // onValidate: (email) {
                  //   if (email!.contains('@') && email.contains('.')) {
                  //     return null;
                  //   }
                  //   return 'Invalid email';
                  // },
                ),
                CustomTextField(
                  hint: 'Password',
                  isPassword: true,
                  controller: passwordC,
                  // onValidate: (password) {
                  //   if (password!.length >= 8) {
                  //     return null;
                  //   }
                  //   return 'Weak password';
                  // },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/signup');
                  },
                  child: Text('first time? create account'),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      var token = await login(
                        username: emailC.text,
                        password: passwordC.text,
                      );
                      if (token != null) {
                        // save the user token
                      SharedPreferences sp = await SharedPreferences.getInstance();
                      sp.setString('token', token);
                      
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AllProducts();
                            },
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error'),
                            duration: Duration(seconds: 1),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error'),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Text('Sign in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> login({
    required String username,
    required String password,
  }) async {
    String endpoint = 'https://fakestoreapi.com/auth/login';
    var response = await http.post(
      Uri.parse(endpoint),
      body: {"username": username, "password": password},
    );
    log(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      log('Token : ${data['token']}');
      return data['token'];
    } else {
      var data = jsonDecode(response.body);
      log('error  : ${data}');
      return null;
    }
  }
}
