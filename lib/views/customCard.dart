import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, this.imgUrl, required this.courseName}) : super(key: key);
  final String? imgUrl;
  final String courseName;
  @override
  Widget build(BuildContext context) {
    var screenSize=MediaQuery.of(context).size;
    return Container(
      child: Column(
          children: [
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5.0, top: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imgUrl!,
                width: 150,
                height: 200,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            courseName,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800),
          ),
        ],
      ),
    );
  }
}
