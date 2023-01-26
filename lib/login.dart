import 'package:flutter/material.dart';
import 'package:lab6/register.dart';
import 'package:lab6/services/auth_service.dart';
import 'package:lab6/success.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _fromkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
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
                    print("Successful");
                    AuthService.loginUser(_emailController.text, _passwordController.text).then((value){
                      if( value == 1){
                        Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SuccessPage())
                );
                      }
                    });
                  }
                },
                child: const Text("Login")),
            ElevatedButton(onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => Register())
                );
            }, child: const Text("Register"))
          ],
        ),
      )),
    );
  }
}
