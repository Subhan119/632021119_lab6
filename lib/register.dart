import 'package:flutter/material.dart';

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