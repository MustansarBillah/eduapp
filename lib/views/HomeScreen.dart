import 'package:eduapp/constants/customlist.dart';
import 'package:eduapp/views/CustomForm.dart';
import 'package:eduapp/views/customCard.dart';
import 'package:eduapp/views/login.dart';
import 'package:eduapp/views/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Icon(Icons.done));
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
                  child: Center(child: Text("Log Out"))),
            ),
          ],
        ),
        body: Container(

            height: screenSize.height * 0.30,

            child: ListView.builder(
              itemCount: CustomList.coursesList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return CustomCard(
                  courseName: CustomList.coursesList[index]["courseName"],
                  imgUrl: CustomList.coursesList[index]["courseImg"],
                );
              },
            )),
      ),
    );
  }
}
