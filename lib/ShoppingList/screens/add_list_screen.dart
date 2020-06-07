import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:leeks/ShoppingList/shoppinglist/ListData.dart';

class AddListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Container(
      color: Color(0xff757575),
      child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'New List',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'MovenPro',
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: Image.asset('assets/addlist.png'),
              ),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                ),
                autofocus: true, //auto keyboard come out
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'MovenPro',
                  fontSize: 18,
                ),
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
              ),
              FlatButton(
                onPressed: () {
                  if (newTaskTitle != null) {
                    Provider.of<ListData>(context).addTask(newTaskTitle);
                  }
                  Navigator.pop(context);
                },
                child: Text(
                  'Add List',
                  style: TextStyle(
                    fontFamily: 'MovenPro',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue[800],
              ),
            ],
          )),
    );
  }
}
