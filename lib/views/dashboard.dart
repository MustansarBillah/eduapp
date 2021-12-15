import 'package:eduapp/constants/customlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'catCard.dart';
import 'customCard.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
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
        Center(child: Text("Categories")),
        Container(
          height: screenSize.height * 0.60,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) => CatCard(
              imgLink: 'assets/images/2.png',
            ),
            itemCount: 6,
          ),
        )
      ],
    );
  }
}
