import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leeks/HomePage.dart';
import 'package:leeks/Widgets/Tiles.dart';
import 'package:leeks/constants.dart';
import 'package:leeks/groceryList.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BrowseTiles extends StatefulWidget {

  @override
  _BrowseTilesState createState() => _BrowseTilesState();
}

class _BrowseTilesState extends State<BrowseTiles> {
  int displayIndex = 0;
  static int colorIndex = 0;
  var catColors = [selectedCat[colorIndex], unselectedCat[colorIndex], unselectedCat[colorIndex], unselectedCat[colorIndex], unselectedCat[colorIndex], unselectedCat[colorIndex], unselectedCat[colorIndex]];
  FocusNode _focus = new FocusNode();
  bool isSearching = false;
  TextEditingController searchController = new TextEditingController();
  TextEditingController detailController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      filterTiles();
    });

    detailController.addListener(() {
      addDetail();
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
  
  addDetail() {
    final groceryList grocerylist = Provider.of<groceryList>(context);
    grocerylist.addDetail(detailController.text);
  
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
        if (_tiles.isEmpty) {
          Tile t = new Tile("proxy", searchController.text); 
          _tiles.add(t);
        }
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

  Widget gridFormation(List<Tile> list) {
    return GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 3,
      padding: const EdgeInsets.all(6),
      crossAxisSpacing: 6,
      mainAxisSpacing: 6,
      childAspectRatio: 0.89,
      children: List.generate(list.length, (index) {
        return GridTile(
          child: Tile(
            list[index].img, 
            list[index].name,
            details: list[index].details,

          )
        );
      },
      )
    );
  }

  Widget catTile(String name, String img, int index) {
    final groceryList grocerylist = Provider.of<groceryList>(context);
    int colorIndex = grocerylist.colorIndex;

    for (int i = 0; i < catColors.length; i++) {
      catColors[i] = unselectedCat[colorIndex];
    }
    catColors[displayIndex] = selectedCat[colorIndex];

    return InkWell(
      splashColor: Colors.transparent,
      onTap: () { 
        setState(() {
          displayIndex = index;
          for (int i = 0; i < catColors.length; i++) {
            catColors[i] = unselectedCat[colorIndex];
          }
          catColors[index] = selectedCat[colorIndex];
        });},
      child: Column(
        children: <Widget>[
          Container(
            child: Image.asset(img),
            width: MediaQuery.of(context).size.width * 0.2,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.2),
              color: catColors[index],
            ),
          ),
          SizedBox(height: 10),
          Text(name, style: TextStyle(fontFamily: "MavenPro", fontSize: 17, fontWeight: FontWeight.bold, color: words[colorIndex]),),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget createDetails() {
    final groceryList grocerylist = Provider.of<groceryList>(context);
      var cats = [grocerylist.recentlyUsed, fruitsVegetables, meatFish, dairy, dryGoods, snacksSweets, beverages];

    return Container(
        color: bg[grocerylist.colorIndex],
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Text(grocerylist.curr.name, style: TextStyle(fontFamily: "MavenPro", fontWeight: FontWeight.bold, fontSize: 25, color: words[grocerylist.colorIndex]),),
            SizedBox(height: 30),
            Container(
              height: 100,
              child: CupertinoTextField(
                controller: detailController,
                padding: const EdgeInsets.symmetric(vertical: 12),
                keyboardType: TextInputType.text,
                placeholder: "Quantity, description...",
                placeholderStyle: TextStyle(
                  fontFamily: "MavenPro",
                  color: Colors.grey[600],
                  fontSize: 20.0,
                ),
                prefix: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.create, color: Colors.grey[600]),
                ),     
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[200],
                ),
                onSubmitted: (text) {
                  for (int i = 1; i < 6; i++) {
                  for (int j = 0 ; j < cats[i].length; j++) {
                    if (cats[i][j].img == grocerylist.curr.img) {
                      cats[i][j].details = text;
                      detailController.text = '';
                      setState(() {
                        grocerylist.addDetail(detailController.text);
                      });
                      break;
                    }
                  }
                }
                },
              ),
            ),
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
      catTile("Meat & Fish", "assets/fish.png", 2),
      catTile("Dairy", "assets/milk.png", 3),
      catTile("Dry Goods", "assets/flour.png", 4),
      catTile("Snacks", "assets/chips.png", 5),
      catTile("Beverages", "assets/coke.png", 6)
    ];

    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(15.0),
      topRight: Radius.circular(15.0), 
    );

    return SlidingUpPanel(
      color: bg[grocerylist.colorIndex],
      minHeight: grocerylist.details ? 40 : 0,
      maxHeight: 250,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      borderRadius: radius,
      panel: grocerylist.curr == null ? Text("") : createDetails(),
      collapsed: Container(
        decoration: BoxDecoration(
          color: bg[grocerylist.colorIndex],
          borderRadius: radius,
        ),
        child: Center(
          child: Text(
            "Add details",
            style: TextStyle(color: words[grocerylist.colorIndex], fontFamily: "MavenPro", fontSize: 20),
          ),
        ),
      ),


          body: Scaffold(
          backgroundColor: bg[grocerylist.colorIndex],

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
                            child: Icon(Icons.search, color: Colors.grey[600]),
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
                        child: Text("CANCEL", style: TextStyle(fontSize: 15, fontFamily: "MavenPro", fontWeight: FontWeight.bold, color: Colors.grey[700]),),
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
                          height: MediaQuery.of(context).size.height * 0.17,
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
                        
                        (displayIndex == 0 && grocerylist.recentlyUsed.isEmpty) ?
                        Padding(
                          padding: const EdgeInsets.only(top: 100.0),
                          child: Text("No recent items", style: TextStyle(fontFamily: "MavenPro", fontSize: 25, color: words[grocerylist.colorIndex]),),
                        ) :
                        gridFormation(cats[displayIndex]),
                        SizedBox(height: 200),
                      

                      ],
                    )
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}