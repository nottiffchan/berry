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
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final GlobalKey<TileState> _key = GlobalKey();

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          elevation: 0.5,
          // backgroundColor: Color(0xff6474f0),
          backgroundColor: Color(0xff9179e0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(60, 20))),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 5, 10, 10),
              //   child: Image.asset('assets/berry-png-new.png', fit: BoxFit.contain, height: 40),
              // ),
              Text("berry", style: TextStyle(color: Colors.white, fontFamily: "FredokaOne", fontSize: 38),)
            ],
          )
        ),
      ),


// SIDE BAR LIST STUFF HERE
      // drawer: Drawer(
      //   child: Column(
      //     children: [
      //       Expanded(
      //         flex: 4,
      //         child: Container(
      //           child: DrawerHeader(
      //             decoration: BoxDecoration(
      //               image: DecorationImage(
      //                 image: AssetImage("assets/sidebarmenu.png"),
      //                 fit: BoxFit.cover,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       Expanded(
      //         flex: 16,
      //         child: ListsScreen(),
      //       ),
      //       Expanded(
      //         flex: 2,
      //         child: GestureDetector(
      //           onTap: () {
      //             showModalBottomSheet(
      //               context: context,
      //               isScrollControlled: true,
      //               builder: (context) => SingleChildScrollView(
      //                 child: Container(
      //                   padding: EdgeInsets.only(
      //                       bottom: MediaQuery.of(context).viewInsets.bottom),
      //                   child: AddListScreen(),
      //                 ),
      //               ),
      //             );
      //           },
      //           child: Container(
      //             color: Colors.grey[200],
      //             child: Row(
      //               children: <Widget>[
      //                 Padding(
      //                   padding: const EdgeInsets.all(15.0),
      //                   child: Icon(
      //                     Icons.add,
      //                     size: 30,
      //                   ),
      //                 ),
      //                 Text(
      //                   "ADD LIST",
      //                   style: TextStyle(
      //                     fontSize: 20,
      //                     fontFamily: "MavenPro",
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),


// SLIVER APP BAR
              
      // body: NestedScrollView(
      //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      //     return <Widget>[
      //           SliverAppBar(
      //             backgroundColor: Colors.grey[50],
      //             elevation: 0,
      //             expandedHeight: 100,
      //             floating: false,
      //             pinned: true,
      //             snap: false,
      //             flexibleSpace: FlexibleSpaceBar(
      //               titlePadding: EdgeInsets.symmetric(horizontal: 8, vertical: 9),
      //               centerTitle: true,
      //               title: Padding(
      //                 padding: const EdgeInsets.only(top: 15),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: <Widget>[
      //                     Image.asset('assets/berry-png-new.png', fit: BoxFit.contain, height: 42),
      //                     Text("berry", style: TextStyle(color: berryRed, fontFamily: "FredokaOne", fontSize: 43),)
      //                   ],
      //                 ),
      //               ),
      //               // background:
      //               //     Image.asset('assets/berrybanner3.png', fit: BoxFit.cover),
      //             ),
      //           )
      //         ];
      //   },


// BODY
        body: Column(
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
                      style: GoogleFonts.mavenPro(),
                      keyboardType: TextInputType.text,
                      placeholder: "What u want buy",
                      placeholderStyle: TextStyle(
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
          ],
        ),
    // ),
    );
  }
}