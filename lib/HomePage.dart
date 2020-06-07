import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leeks/groceryList.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'package:leeks/Widgets/Tiles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leeks/ShoppingList/screens/list_screen.dart';
import 'package:leeks/ShoppingList/screens/add_list_screen.dart';

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
  
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

  ExpansionTile categories(List<Tile> list, String label) {
    return ExpansionTile(
                title: Text(label, style: GoogleFonts.mavenPro(fontSize: 20, color: navy)),
                children: <Widget>[
                  gridFormation(list)
                ],
                backgroundColor: Colors.white,
              );
  }

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

  @override
  Widget build(BuildContext context) {
    final groceryList grocerylist = Provider.of<groceryList>(context);

    return Scaffold(
      backgroundColor: Colors.white,

// SIDE BAR LIST STUFF HERE
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/sidebarmenu.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 16,
              child: ListsScreen(),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: AddListScreen(),
                      ),
                    ),
                  );
                },
                child: Container(
                  color: Colors.grey[200],
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ),
                      Text(
                        "ADD LIST",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "MavenPro",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),


// SLIVER APP BAR
              
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
                SliverAppBar(
                  backgroundColor: navy,
                  expandedHeight: 225,
                  floating: false,
                  pinned: true,
                  snap: false,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.symmetric(horizontal: 8, vertical: 9),
                    centerTitle: !isSearching,
                    title: Container(
                      width: isSearching ? MediaQuery.of(context).size.width * 0.63 : MediaQuery.of(context).size.width * 0.63,
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: CupertinoTextField(
                              focusNode: _focus,
                              controller: searchController,
                              style: GoogleFonts.mavenPro(),
                              keyboardType: TextInputType.text,
                              placeholder: "What u want buy",
                              placeholderStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                              prefix: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(Icons.search, color: Colors.white),
                              ),
                              suffix: Padding(
                                padding: const EdgeInsets.all(3),
                                child: InkWell(
                                    child: Icon(Icons.clear, color: Colors.grey[300], size: 20),
                                    onTap: () {
                                        searchController.text = '';
                                    }
                                ), 
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: navyAccent,
                            ),
                            ),
                          ),
                          isSearching ? Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: InkWell(
                            child: Text("CANCEL", style: TextStyle(fontSize: 10, fontFamily: "MavenPro", fontWeight: FontWeight.bold),),
                            onTap: () {_focus.unfocus(); },
                          )) : Text("")
                        ],
                      )
                    ),
                    background:
                        Image.asset('assets/berrybanner1.png', fit: BoxFit.cover),
                  ),
                )
              ];
        },


// BODY
        body: GestureDetector(
              onTap: () {_focus.unfocus(); },
              child: isSearching 
              ? gridFormation(grocerylist.filteredTiles)
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[

  // ADDED TO GROCERY LIST
                        Container(
                          child: grocerylist.inList.length == 0
                          ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
                            child: Text("Nothing to buy!", style: TextStyle(fontFamily: "MavenPro",  fontSize: 25, color: navy),),
                          )
                          : gridFormation(grocerylist.inList)
                        ),


  // EXPANSION TILES
                        categories(grocerylist.recentlyUsed, "Recently Used"),
                        categories(fruitsVegetables, "Fruits and Vegetables"),
                        categories(meatFish, "Meat and Fish"),
                        categories(dairy, "Dairy"),
                        categories(dryGoods, "Dry Goods"),
                        categories(snacksSweets, "Snacks and Sweets"),
                        categories(beverages, "Beverages"),


                      ],
                    ),
                  )
                ),
              ),
      ),
    );
  }
}