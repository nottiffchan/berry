import 'package:flutter/material.dart';

class Tiles extends StatefulWidget {
  @override
  _TilesState createState() => _TilesState();
}

class _TilesState extends State<Tiles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Icon(
        Icons.fastfood,
        size: 80,
        color: Colors.white,
      ),
    );
  }
}
