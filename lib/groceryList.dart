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

  bool _isSearching = false;
  FocusNode _focus = FocusNode();

  List<Tile> get inList => _inList;
  List<String> get imgList => _imgList;
  List<Tile> get recentlyUsed => _recentlyUsed;
  List<String> get recentlyUsedimg => _recentlyUsedimg;
  List<Tile> get filteredTiles => _filteredTiles;
  List<Tile> get allTiles => _allTiles;

  // bool get isSearching => _isSearching;
  // FocusNode get focus => _focus;


  add(Tile t) {
    if (_recentlyUsedimg.contains(t.img)) {
      int index = _recentlyUsedimg.indexOf(t.img);
      _recentlyUsed.removeAt(index);
      _recentlyUsedimg.removeAt(index);
    }
    _inList.add(t);
    _imgList.add(t.img);

    if (_filteredTiles.isNotEmpty) {
      _filteredTiles = [];
    }

    notifyListeners();
  } 

  remove(Tile t) {
    int index = _imgList.indexOf(t.img);
    _inList.removeAt(index);
    _imgList.removeAt(index);

    notifyListeners();
  }

  recentAdd(Tile t) {
    if (_recentlyUsedimg.contains(t.img)) {
      int index = _recentlyUsedimg.indexOf(t.img);
      _recentlyUsed.removeAt(index);
      _recentlyUsedimg.removeAt(index);
    }
    if (_recentlyUsed.length == maxRecentItems) {
      _recentlyUsed.removeAt(maxRecentItems - 1);
      _recentlyUsedimg.removeAt(maxRecentItems - 1);
    }
    _recentlyUsed.insert(0, t);
    _recentlyUsedimg.insert(0, t.img);

    notifyListeners();
  }

  filterTiles(List<Tile> list) {
    _filteredTiles = list;
    notifyListeners();
  }

}