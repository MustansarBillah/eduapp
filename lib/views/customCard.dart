import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, this.imgUrl, required this.courseName}) : super(key: key);
  final String? imgUrl;
  final String courseName;
  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return Container(
      height: 100,
      color: Colors.blue,
      child: Column(
          children: [
            Image.asset(imgUrl!, width: 100,),
            SizedBox(width: 20,),
            Text(courseName,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.blue.shade800),)
          ],

      ),
    );
  }
}
