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
  double opacityLevel = 1.0;

  var fruitsVegetables = <Tile>[
    new Tile(("assets/banana.png"), 'Banana'),
    new Tile(("assets/broccoli.png"), 'Broccoli'),
    new Tile('assets/coconut.png', 'Coconut'),
    new Tile('assets/corn.png', 'Corn'),
    new Tile('assets/pepper.png', 'Capsicum'),
    new Tile(("assets/cherries.png"), 'Cherry'),
    new Tile('assets/lemon.png', 'Lemon'),
    new Tile(("assets/mushroom.png"), 'Mushroom'),
    new Tile('assets/orange.png', 'Orange'),
    new Tile('assets/pineapple.png', 'Pineapple'),
    new Tile('assets/tomato.png', 'Tomato'),
    new Tile('assets/watermelon.png', 'Watermelon')
  ];

  var meatFish = <Tile>[
    new Tile(("assets/meat.png"), 'Beef'),
    new Tile(("assets/chicken.png"), 'Chicken'),
    new Tile('assets/crab.png', 'Crab'),
    new Tile(("assets/eggs.png"), 'Eggs'),
    new Tile(("assets/fish.png"), 'Fish'),
    new Tile(("assets/lobster.png"), 'Lobster'),
    new Tile("assets/pork.png", "Pork"),
    new Tile('assets/sausage.png', 'Sausage'),
    new Tile("assets/shrimp.png", "Shrimp")
  ];

  var dairy = <Tile>[
    new Tile(("assets/butter.png"), 'Butter'),
    new Tile(("assets/cheese.png"), 'Cheese'),
    new Tile(("assets/milk.png"), 'Milk'),
  ];

  var dryGoods = <Tile>[
    new Tile(("assets/bread.png"), 'Bread'),
    new Tile(("assets/flour.png"), 'Flour'),
    new Tile(("assets/noodles.png"), 'Noodles'),
    new Tile(("assets/rice.png"), 'Rice'),
    new Tile(("assets/onion.png"), 'Onion'),
  ];

  var beverages = <Tile>[
    new Tile(("assets/beer.png"), 'Beer'),
    new Tile(("assets/coffee.png"), 'Coffee'),
    new Tile(("assets/juice.png"), 'Juice'),
    new Tile(("assets/coke.png"), 'Soft Drink'),
    new Tile(("assets/tea.png"), 'Tea'),
    new Tile("assets/virus.png", 'Corona Beer'),
  ];

  var snacksSweets = <Tile>[
    new Tile(("assets/ice-cream.png"), 'Ice Cream'),
    new Tile(("assets/chips.png"), 'Chips'),
    new Tile(("assets/chocolate.png"), 'Chocolate'),
  ];


  @override
  Widget build(BuildContext context) {
    final groceryList grocerylist = Provider.of<groceryList>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Column(
          children: [

// START OF SIDE BAR LIST STUFF

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

// END OF SIDE BAR LIST STUFF


// START OF SLIVER BAR

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
                  height: MediaQuery.of(context).size.height * 0.04,
                  child: CupertinoTextField(
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

// END OF SLIVER BAR

        body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

// START OF ADDED TO GROCERY LIST TILES

              Container(
                child: grocerylist.inList.length == 0 ?
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
                  child: Text("Nothing to buy!", style: TextStyle(fontFamily: "MavenPro",  fontSize: 25, color: navy),),
                ) : 
                GridView.count(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  crossAxisCount: 3,
                  padding: const EdgeInsets.all(6),
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  childAspectRatio: 1,
                  children: List.generate(grocerylist.inList.length, (index) {
                      return GridTile(
                        child: Tile(
                          grocerylist.inList[index].img, 
                          grocerylist.inList[index].name,
                        )
                      );
                  },
                  )
                ),
              ),

// END OF ADDED TO GROCERY LIST TILES


// RECENTLY USED EXPANSION TILE

              ExpansionTile(
                title: Text("Recently Used", style: GoogleFonts.mavenPro(fontSize: 20, color: navy)),
                children: <Widget>[
                  GridView.count(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      crossAxisCount: 3,
                      padding: const EdgeInsets.all(6),
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                      childAspectRatio: 1,
                      children: List.generate(grocerylist.recentlyUsed.length, (index) {
                        return GridTile(
                          child: Tile(
                            grocerylist.recentlyUsed[index].img, 
                            grocerylist.recentlyUsed[index].name,
                          )
                        );
                      },
                      )
                    ),
                ],
                backgroundColor: Colors.white,
                // initiallyExpanded: false,
              ),


// FRUIT AND VEG EXPANSION TILE
              ExpansionTile(
                title: Text("Fruits and Vegetables", style: GoogleFonts.mavenPro(fontSize: 20, color: navy)),
                children: <Widget>[
                  GridView.count(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    crossAxisCount: 3,
                    padding: const EdgeInsets.all(6),
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: 1,
                    children: List.generate(fruitsVegetables.length, (index) {
                      return GridTile(
                        child: Tile(
                          fruitsVegetables[index].img, 
                          fruitsVegetables[index].name,
                        )
                      );
                    },
                    )
                  ),
                ],
                backgroundColor: Colors.white,
                // initiallyExpanded: false,
              ),



// MEAT AND FISH EXPANSION TILE
              ExpansionTile(
                title: Text("Meat and Fish", style: GoogleFonts.mavenPro(fontSize: 20, color: navy)),
                children: <Widget>[
                  GridView.count(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    crossAxisCount: 3,
                    padding: const EdgeInsets.all(6),
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: 1,
                    children: List.generate(meatFish.length, (index) {
                      return GridTile(
                        child: Tile(
                          meatFish[index].img, 
                          meatFish[index].name,
                        )
                      );
                    },
                    )
                  ),
                ],
                backgroundColor: Colors.white,
                initiallyExpanded: false,
              ),


// DAIRY EXPANSION TILE
              ExpansionTile(
                title: Text("Dairy", style: GoogleFonts.mavenPro(fontSize: 20, color: navy)),
                children: <Widget>[
                  GridView.count(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    crossAxisCount: 3,
                    padding: const EdgeInsets.all(6),
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: 1,
                    children: List.generate(dairy.length, (index) {
                      return GridTile(
                        child: Tile(
                          dairy[index].img, 
                          dairy[index].name,
                        )
                      );
                    },
                    )
                  ),
                ],
                backgroundColor: Colors.white,
                initiallyExpanded: false,
              ),


// DRY GOODS EXPANSION TILE

              ExpansionTile(
                title: Text("Dry Goods", style: GoogleFonts.mavenPro(fontSize: 20, color: navy)),
                children: <Widget>[
                  GridView.count(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    crossAxisCount: 3,
                    padding: const EdgeInsets.all(6),
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: 1,
                    children: List.generate(dryGoods.length, (index) {
                      return GridTile(
                        child: Tile(
                          dryGoods[index].img, 
                          dryGoods[index].name,
                        )
                      );
                    },
                    )
                  ),
                ],
                backgroundColor: Colors.white,
                initiallyExpanded: false,
              ),


// SNACKS AND SWEETS EXPANSION TILE
              ExpansionTile(
                title: Text("Snacks and Sweets", style: GoogleFonts.mavenPro(fontSize: 20, color: navy)),
                children: <Widget>[
                  GridView.count(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    crossAxisCount: 3,
                    padding: const EdgeInsets.all(6),
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: 1,
                    children: List.generate(snacksSweets.length, (index) {
                      return GridTile(
                        child: Tile(
                          snacksSweets[index].img, 
                          snacksSweets[index].name,
                        )
                      );
                    },
                    )
                  ),
                ],
                backgroundColor: Colors.white,
                initiallyExpanded: false,
              ),


// BEVERAGES EXPANSION TILE
              ExpansionTile(
                title: Text("Beverages", style: GoogleFonts.mavenPro(fontSize: 20, color: navy)),
                children: <Widget>[
                  GridView.count(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    crossAxisCount: 3,
                    padding: const EdgeInsets.all(6),
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: 1,
                    children: List.generate(beverages.length, (index) {
                      return GridTile(
                        child: Tile(
                          beverages[index].img, 
                          beverages[index].name,
                        )
                      );
                    },
                    )
                  ),
                ],
                backgroundColor: Colors.white,
                initiallyExpanded: false,
              ),
            ],
          ),
        )
      ),
    )
    );
  }
}
