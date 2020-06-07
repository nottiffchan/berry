import 'package:flutter/material.dart';

class ShoppingListTile extends StatelessWidget {
  final String listTitle;
  final Function longPressCallback;

  ShoppingListTile({this.listTitle, this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[400],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onLongPress: longPressCallback,
        title: Text(
          listTitle,
          style: TextStyle(
            fontFamily: 'MavenPro',
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        trailing: InkWell(
          onLongPress: () {
            longPressCallback();
          },
          child: Icon(
            Icons.cancel,
          ),
        ),
      ),
    );
  }
}
