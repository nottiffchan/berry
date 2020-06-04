import 'package:flutter/material.dart';
import 'package:leeks/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:leeks/ShoppingList/shoppinglist/ListData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => ListData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
