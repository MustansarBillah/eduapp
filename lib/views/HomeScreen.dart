import 'package:eduapp/views/CustomForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              Text("Sign Up", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24),),
              Text("Sign Up", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24),),
              Text("Sign Up", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24),),
              Text("Sign Up", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24),)
            ],
          ),
        ),
          appBar: AppBar(
            leading: Builder(
              builder: (context) {
                return InkWell(
                    onTap: (){
                      Scaffold.of(context).openDrawer();
                    },
                    child: Icon(Icons.done));
              }
            ),
            title: Text("Edu App"),

          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(

              children: [
                Center(child: Text("Sign Up", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 24),)),
                CustomForm(),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.blue,
                      Colors.red,
                    ]

                    )
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}