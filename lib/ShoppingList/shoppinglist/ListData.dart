import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leeks/ShoppingList/shoppinglist/list.dart';
import 'dart:collection';

class ListData extends ChangeNotifier {
  List<ShoppingList> _shoppinglists = [];

  UnmodifiableListView<ShoppingList> get shoppinglists {
    return UnmodifiableListView(_shoppinglists);
  }

  void addTask(String newTaskTitle) {
    final shoppingList = ShoppingList(name: newTaskTitle);
    _shoppinglists.add(shoppingList);
    notifyListeners();
  }

  void deleteTask(ShoppingList shoppingList) {
    _shoppinglists.remove(shoppingList);
    notifyListeners();
  }
}
