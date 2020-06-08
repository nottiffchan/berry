import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leeks/Widgets/Tiles.dart';
import 'package:leeks/constants.dart';
import 'package:leeks/groceryList.dart';
import 'package:provider/provider.dart';

class BrowseTiles extends StatefulWidget {
  @override
  _BrowseTilesState createState() => _BrowseTilesState();
}

class _BrowseTilesState extends State<BrowseTiles> {
  int displayIndex = 0;
  var catColors = [themePurple, duskyPurple, duskyPurple, duskyPurple, duskyPurple, duskyPurple, duskyPurple];

  FocusNode _focus = new FocusNode();
  bool isSearching = false;
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      filterTiles();
    });
    _focus.addListener(onFocusChange);
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  void onFocusChange() { 
    setState(() {
        searchController.text = '';
        isSearching = !isSearching;
    });
  }

  filterTiles() {
    final groceryList grocerylist = Provider.of<groceryList>(context);
    List<Tile> _tiles = [];
    _tiles.addAll(allItems);

    if (searchController.text.isNotEmpty) {
      _tiles.retainWhere((tile) {
        String searched = searchController.text.toLowerCase();
        String tileName = tile.name.toLowerCase();
        return tileName.startsWith(searched);
      });

      setState(() {
        grocerylist.filterTiles(_tiles);
      });
    }
  }

  Future<List<Tile>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    if (search == "empty") return [];
    return List.generate(search.length, (int index) {
      return Tile(
        "img : $search $index",
        "Name :$search $index",
      );
    });
  }

  // ExpansionTile categories(List<Tile> list, String label) {
  //   return ExpansionTile(
  //     title: Text(label, style: GoogleFonts.mavenPro(fontSize: 20, color: navy)),
  //     children: <Widget>[
  //       gridFormation(list)
  //     ],
  //     backgroundColor: Colors.white,
  //   );
  // }

  Widget gridFormation(List<Tile> list) {
    return GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 3,
      padding: const EdgeInsets.all(6),
      crossAxisSpacing: 6,
      mainAxisSpacing: 6,
      childAspectRatio: 1,
      children: List.generate(list.length, (index) {
        return GridTile(
          child: Tile(
            list[index].img, 
            list[index].name,
          )
        );
      },
      )
    );
  }

  

  Widget catTile(String name, String img, int index) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () { setState(() {
        displayIndex = index;
        for (int i = 0; i < catColors.length; i++) {
          catColors[i] = duskyPurple;
        }
        catColors[index] = themePurple;
      });},
      child: Column(
        children: <Widget>[
          Container(
            child: Image.asset(img),
            width: 90.0,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              color: catColors[index],
            ),
          ),
          SizedBox(height: 10),
          Text(name, style: TextStyle(fontFamily: "MavenPro", fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey[700]),),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final groceryList grocerylist = Provider.of<groceryList>(context);
    var cats = [grocerylist.recentlyUsed ,fruitsVegetables, meatFish, dairy, dryGoods, snacksSweets, beverages];
    var grids = [
      catTile("Recent", "assets/harvest.png", 0),
      catTile("Fruit & Veg", "assets/corn.png", 1),
      catTile("Meat and Fish", "assets/fish.png", 2),
      catTile("Dairy", "assets/milk.png", 3),
      catTile("Dry Goods", "assets/flour.png", 4),
      catTile("Snacks & Sweets", "assets/chips.png", 5),
      catTile("Beverages", "assets/coke.png", 6)
    ];


    return Scaffold(
      backgroundColor: Colors.white,

// BODY
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.12,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: CupertinoTextField(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        focusNode: _focus,
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        placeholder: "Search for ingredients...",
                        placeholderStyle: TextStyle(
                          fontFamily: "MavenPro",
                          color: Colors.grey[600],
                          fontSize: 20.0,
                        ),
                        prefix: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.search, color: Colors.grey[700]),
                        ),
                        suffix: isSearching ? Padding(
                          padding: const EdgeInsets.all(8),
                          child: InkWell(
                              child: Icon(Icons.clear, color: Colors.grey[600], size: 20),
                              onTap: () {
                                  searchController.text = '';
                              }
                          ), 
                      ) : Text(""),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[200],
                      ),
                      ),
                    ),
                    isSearching ? Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: InkWell(
                      child: Text("CANCEL", style: TextStyle(fontSize: 15, fontFamily: "MavenPro", fontWeight: FontWeight.bold),),
                      onTap: () {_focus.unfocus(); },
                    )) : Text("")
                  ],
                )
              ),

              GestureDetector(
              onTap: () {_focus.unfocus(); },
              child: isSearching 
              ? gridFormation(grocerylist.filteredTiles)
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: <Widget>[

  // ADDED TO GROCERY LIST

                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                        // padding: EdgeInsets.only(bottom: 10),
                        height: 130.0,
                        child: Scrollbar(
                          child: ListView(  
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              grids[0],
                              SizedBox(width: 10),
                              grids[1],
                              SizedBox(width: 10),
                              grids[2],
                              SizedBox(width: 10,),
                              grids[3],
                              SizedBox(width: 10,),
                              grids[4],
                              SizedBox(width: 10,),
                              grids[5],
                              SizedBox(width: 10,),
                              grids[6],
                            ],
                          ),
                        ),
                      ),

                      gridFormation(cats[displayIndex]),

                    ],
                  )
                ),
              ),
            ],
          ),
        ),
    );
  }
}