import 'package:eduapp/constants/customlist.dart';
import 'package:eduapp/views/CustomForm.dart';
import 'package:eduapp/views/customCard.dart';
import 'package:eduapp/views/login.dart';
import 'package:eduapp/views/signup.dart';
import 'package:eduapp/views/uploadCourse.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  int selectedIndex = 0;
  List homeList = [
    Dashboard(),
    LogIn(),
    SignUp(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Text("Edu App"),
                Image.asset(
                  "assets/images/1.png",
                  width: screenSize.width,
                  height: screenSize.height * 0.30,
                  fit: BoxFit.fill,
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("About Us"),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("About Us"),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("About Us"),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Icon(Icons.menu));
          }),
          title: Text("Edu App"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                  onTap: () async {
                    final User user = await auth.currentUser!;
                    if (user == null) {
                      Scaffold.of(context).showSnackBar(const SnackBar(
                        content: Text('No one has signed in.'),
                      ));
                      return;
                    }
                    await auth.signOut();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => LogIn()));
                    final String uid = user.uid;
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(uid + ' has successfully signed out.'),
                    ));
                  },
                  child: Center(child: Icon(Icons.exit_to_app))),
            ),
          ],
        ),
        body: homeList[(selectedIndex)],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Contact Us"),
            BottomNavigationBarItem(icon: Icon(Icons.ten_k), label: "Map"),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red.shade900,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => UploadCourse()));
          },
        ),
      ),
    );
  }
}
