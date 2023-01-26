import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lab6/firebase_options.dart';
import 'package:lab6/login.dart';


class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Successful'), actions: [
        IconButton(onPressed: () {
          FirebaseAuth.instance.signOut();
          Navigator.pushReplacement (
            context,
            MaterialPageRoute(
              builder: (context) => Loginpage()
              ));
        }, icon: const Icon(Icons.logout)),
      ],),
      body: SafeArea(child: Row(
        children: [
          Text('Successful'),
          Icon(Icons.check_box,
          color: Colors.blue)
        ],
      )),
    );
  }
}






