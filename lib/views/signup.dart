import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'CustomForm.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(

            children: [
              Center(child: Text("Sign Up", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24),)),
              CustomForm(),

            ],
          ),
        ),
      ),
    );
  }
}
