import 'package:flutter/material.dart';
import 'package:flutter_s2/screens/home.dart';
import 'package:flutter_s2/screens/signin.dart';
import 'package:flutter_s2/widgets/custom_text_field.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  var emailC = TextEditingController();
  var passwordC = TextEditingController();
  var confirmPasswordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign up')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/signup.jpg',
                width: 300,
              ),
              CustomTextField(hint: 'Email', controller: emailC),
              CustomTextField(
                hint: 'Password',
                isPassword: true,
                controller: passwordC,
              ),
              CustomTextField(
                hint: 'confirm Password',
                isPassword: true,
                controller: confirmPasswordC,
              ),
               TextButton(onPressed: (){
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signin()));
                Navigator.pushReplacementNamed(context, '/');
              }, child: Text('already have account? sign in')),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  if (emailC.text.contains('@') &&
                      emailC.text.contains('.') &&
                      passwordC.text.length >= 8) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Signup Successfully'),
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
                    Navigator.pushNamed(context, '/');
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
                child: Text('Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
