import 'package:flutter/material.dart';
import 'package:flutter_s2/widgets/custom_text_field.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  var emailC = TextEditingController();
  var passwordC = TextEditingController();
  var confirmPasswordC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign up')),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/signup.jpg',
                  width: 300,
                ),
                CustomTextField(hint: 'Email', 
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
                CustomTextField(
                  hint: 'confirm Password',
                  isPassword: true,
                  controller: confirmPasswordC,
                  onValidate: (confirmPassword) {
                    if(confirmPassword == passwordC.text){
                      return null;
                    }
                    return 'Password must be matched';
                  },
                ),
                 TextButton(onPressed: (){
                  Navigator.pushReplacementNamed(context, '/');
                }, child: Text('already have account? sign in')),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                       ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Signup Successfully'),
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
                  child: Text('Sign up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
