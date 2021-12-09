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
  final databaseRef= FirebaseDatabase.instance.ref();
  final formKey= GlobalKey<FormState>();
  final nameC=TextEditingController();
  final emailC=TextEditingController();
  final phoneC=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child:Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
        TextFormField(

        controller: nameC,
          validator: (value){
            if(value==null || value.isEmpty){
              return "Please Enter Your Name";
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: "Enter Your Name",
            border: OutlineInputBorder()
          ),
        ),
          SizedBox(height: 10,),
          TextFormField(

            controller: emailC,
            validator: (value){
              if(value==null || value.isEmpty){
                return "Please Enter Your Name";
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: "Enter Your Email",
                border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(

            controller: phoneC,
            validator: (value){
              if(value==null || value.isEmpty){
                return "Please Enter Your Name";
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: "Enter Your Phone",
                border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
              child: Text("Sign Up"),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                createRecord();
              }

            },
          ),
        ],
      ),
    ),
      
    );
  }
  void createRecord(){
  databaseRef.child("programs").push().set(
    {
      "name":nameC.text,
      "email":emailC.text,
      "phone":phoneC.text
    }

  ).then((value) {});
  }
}
