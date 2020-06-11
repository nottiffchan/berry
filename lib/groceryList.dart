import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leeks/Widgets/Tiles.dart';
import 'constants.dart';

class groceryList extends ChangeNotifier {
  List<Tile> _inList = [];
  List<String> _imgList = [];

  List<Tile> _recentlyUsed = [];
  List<String> _recentlyUsedimg = [];
  int maxRecentItems = 9;  //change as appropriate

  List<Tile> _filteredTiles = [];
  List<Tile> _allTiles = allItems;

  int _colorIndex = 0;

  bool _details = false;
  Tile _curr;

  // var _cats = [[], fruitsVegetables, meatFish, dairy, dryGoods, snacksSweets, beverages];


  List<Tile> get inList => _inList;
  List<String> get imgList => _imgList;
  List<Tile> get recentlyUsed => _recentlyUsed;
  List<String> get recentlyUsedimg => _recentlyUsedimg;
  List<Tile> get filteredTiles => _filteredTiles;
  List<Tile> get allTiles => _allTiles;
  int get colorIndex => _colorIndex;
  bool get details => _details;
  Tile get curr => _curr;
  // List<List<Tile>> get cats => _cats;


  detailsChange(bool b) {
    _details = b;
    notifyListeners();
  }

  addCurrTile(Tile t) {
    _curr = t;
    notifyListeners();
  }

  addDetail(String text) {
    _curr.details = text;
    notifyListeners();
  }

  addDetailToBasketTile(String text) {
    int index = _imgList.indexOf(_curr.name);
    _inList[index].details = text;
    notifyListeners();
  }

  changeCol(int i) {
    _colorIndex = i;
    notifyListeners();
  }

  add(Tile t) {
    if (_recentlyUsedimg.contains(t.name)) {
      int index = _recentlyUsedimg.indexOf(t.name);
      _recentlyUsed.removeAt(index);
      _recentlyUsedimg.removeAt(index);
    }
    _inList.add(t);
    _imgList.add(t.name);

    if (_filteredTiles.isNotEmpty) {
      _filteredTiles = [];
    }

    notifyListeners();
  } 

  remove(Tile t) {
    int index = _imgList.indexOf(t.name);
    _inList.removeAt(index);
    _imgList.removeAt(index);

    notifyListeners();
  }

  recentAdd(Tile t) {
    if (_recentlyUsedimg.contains(t.name)) {
      int index = _recentlyUsedimg.indexOf(t.name);
      _recentlyUsed.removeAt(index);
      _recentlyUsedimg.removeAt(index);
    }
    if (_recentlyUsed.length == maxRecentItems) {
      _recentlyUsed.removeAt(_recentlyUsed.length - 1);
      _recentlyUsedimg.removeAt(_recentlyUsed.length - 1);
    }
    _recentlyUsed.insert(0, t);
    _recentlyUsedimg.insert(0, t.name);

    notifyListeners();
  }

  filterTiles(List<Tile> list) {  
    _filteredTiles = list;
    notifyListeners();
  }


}