import 'package:flutter/material.dart';

class ShoppingListTile extends StatelessWidget {
  final String listTitle;

  ShoppingListTile({this.listTitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        listTitle,
        style: TextStyle(
          fontFamily: 'MavenPro',
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
