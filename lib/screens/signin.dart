import 'package:flutter/material.dart';
import 'package:flutter_s2/screens/home.dart';
import 'package:flutter_s2/screens/signup.dart';
import 'package:flutter_s2/widgets/custom_text_field.dart';

class Signin extends StatelessWidget {
  Signin({super.key});
  var emailC = TextEditingController();
  var passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign in')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/login.jpg',
                width: 300,
              ),
              CustomTextField(hint: 'Email', controller: emailC),
              CustomTextField(
                hint: 'Password',
                isPassword: true,
                controller: passwordC,
              ),
              TextButton(onPressed: (){
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signup()));
                Navigator.pushReplacementNamed(context, '/signup');
              }, child: Text('first time? create account')),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (emailC.text.contains('@') &&
                      emailC.text.contains('.') &&
                      passwordC.text.length >= 8) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Login Successfully'),
                        duration: Duration(seconds: 1),
                        backgroundColor: Colors.green,
                      ),
                    );
                    emailC.clear();
                    passwordC.clear();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context)=> Home()
                    //   ),
                    // );
                    Navigator.pushNamed(context, '/home');
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
    );
  }
}
