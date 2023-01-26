import 'package:flutter/material.dart';
import 'package:lab6/login.dart';
import 'package:lab6/services/auth_service.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _fromkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register')
      ),
      body: SafeArea(
        child: Form(
          key: _fromkey,
          child: ListView(
            children: [
              TextFormField(
              controller: _emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "กรุณากรอก Email";
                }
                return null;
              },
            ),
             TextFormField(
              controller: _passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "กรุณากรอก Password";
                }
                return null;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  
                  if (_fromkey.currentState!.validate()) {
                    
                    print("WELCOME");
                    print(_emailController.toString());
                    AuthService.registerUser(
                      _emailController.text, _passwordController.text).then((value) {
                        if (value == 1){
                          Navigator.pop(context);
                        }
                      });
                    
                  }
                },
                child: const Text("Register")),
            ],
          ),
          )
        ),
    );
  }
}