import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: navy,
              expandedHeight: 250,
              floating: false,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.symmetric(horizontal: 8, vertical: 9),
                centerTitle: true,
                title: Container(
                  width: MediaQuery.of(context).size.width * 0.63,
                  child: CupertinoTextField(
                    style: GoogleFonts.mavenPro(),
                    keyboardType: TextInputType.text,
                    placeholder: "Buy what shit",
                    placeholderStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                    prefix: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Icon(Icons.search, color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: navyAccent,
                    ),
                  ),
                ),
                background:
                    Image.asset('assets/berrybanner1.png', fit: BoxFit.cover),
              ),
            )
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: GridView(
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 125,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                    ),
                    children: List.generate(tiles.length, (index) {
                      return GridTile(
                          child: Tile(
                        tiles[index].category,
                        tiles[index].bg,
                        tiles[index].img,
                        name: tiles[index].name,
                      ));
                    }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
