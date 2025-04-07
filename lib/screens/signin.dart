import 'package:flutter/material.dart';
import 'package:flutter_s2/screens/home.dart';
import 'package:flutter_s2/screens/signup.dart';
import 'package:flutter_s2/widgets/custom_text_field.dart';

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
                  onValidate: (email) {
                    if (email!.contains('@') && email.contains('.')) {
                      return null;
                    }
                    return 'Invalid email';
                  },
                ),
                CustomTextField(
                  hint: 'Password',
                  isPassword: true,
                  controller: passwordC,
                  onValidate: (password) {
                    if(password!.length >= 8){
                      return null;
                    }
                    return 'Weak password';
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/signup');
                  },
                  child: Text('first time? create account'),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Login Successfully'),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.green,
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
}
