import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final FirebaseAuth auth=FirebaseAuth.instance;
  final databaseRef = FirebaseDatabase.instance.ref();
  final formKey = GlobalKey<FormState>();
  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final phoneC = TextEditingController();
  bool success=false;
  late String userEmail;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameC,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter Your Name";
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "Enter Your Name", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailC,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter Email";
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "Enter Email", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordC,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter Password";
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "Enter Password", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: phoneC,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Your Name";
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: "Enter Your Phone", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Text("Sign Up"),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  register();
                  createRecord();

                }
              },
            ),
            Container(
              alignment: Alignment.center,
              child: Text(success == false
                  ? ''
                  : (success
                  ? 'Successfully registered ' + userEmail
                  : 'Registration failed')),
            )
          ],
        ),
      ),
    );
  }

  void createRecord() {
    databaseRef.child("programs").push().set({
      "name": nameC.text,
      "phone": phoneC.text
    }).then((value) {});
  }
  void register() async {
    final User? user = (await
    auth.createUserWithEmailAndPassword(
      email: emailC.text,
      password: passwordC.text,
    )
    ).user;
    if (user != null) {
      setState(() {
        success = true;
        userEmail = user.email!;
      });
    } else {
      setState(() {
        success = true;
      });
    }
  }
}
