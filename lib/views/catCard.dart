import 'package:flutter/material.dart';

class CatCard extends StatefulWidget {
  const CatCard({Key? key, required this.imgLink}) : super(key: key);
  final String imgLink;

  @override
  _CatCardState createState() => _CatCardState();
}

class _CatCardState extends State<CatCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 220,
      child: Column(
        children: [
          Image.asset(widget.imgLink,
              height: 180, width: 180, fit: BoxFit.fill),
        ],
      ),
    );
  }
}
