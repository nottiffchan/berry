import 'package:flutter/material.dart';
import 'package:leeks/HomePage.dart';
import 'package:leeks/groceryList.dart';
import 'package:provider/provider.dart';
import 'package:leeks/ShoppingList/shoppinglist/ListData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => groceryList()),
        ChangeNotifierProvider(builder: (context) => ListData(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
    
    // ChangeNotifierProvider(
    //   create: (context) => groceryList(),
    //   builder: (context) => ListData(),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: HomePage(),
    //   ),
    // );
  }
}
