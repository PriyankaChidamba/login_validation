import 'package:flutter/material.dart';

class LoginValidation extends StatefulWidget {
  const LoginValidation({Key? key}) : super(key: key);

  @override
  State<LoginValidation> createState() => _LoginValidationState();
}

class _LoginValidationState extends State<LoginValidation> {
  final _formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Validation'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'enter the password';
                  }
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'enter the email address';
                  }
                  if (passwordController.text.length < 6) ;
                  return ' enter atleast more than 6 characters';
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      passwordController.clear();
                      emailController.clear();
                    }
                  },
                  child: Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
