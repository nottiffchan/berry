import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:leeks/Widgets/Tiles.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var addedToList = <Tile>[

  ];

  var fruitsVegetables = <Tile>[
    new Tile(grey, ("assets/banana.png"), name: 'Banana'),
    new Tile(grey, ("assets/broccoli.png"), name: 'Broccoli'),
    new Tile(grey,("assets/cherries.png"), name: 'Cherry'),
    new Tile(grey,("assets/mushroom.png"), name: 'Mushroom'),
  ];

  var meatFish = <Tile>[
    new Tile(grey,("assets/meat.png"), name: 'Beef'),
    new Tile(grey,("assets/chicken.png"), name: 'Chicken'),
    new Tile(grey,("assets/eggs.png"), name: 'Eggs'),
    new Tile(grey,("assets/fish.png"), name: 'Fish'),
    new Tile(grey,("assets/lobster.png"), name: 'Lobster'),
  ];

  var dairy = <Tile>[
    new Tile(grey,("assets/butter.png"), name: 'Butter'),
    new Tile(grey,("assets/cheese.png"), name: 'Cheese'),
    new Tile(grey,("assets/milk.png"), name: 'Milk'),
  ];

  var dryGoods = <Tile>[
    new Tile(grey,("assets/bread.png"), name: 'Bread'),
    new Tile(grey,("assets/flour.png"), name: 'Flour'),
    new Tile(grey,("assets/noodles.png"), name: 'Noodles'),
    new Tile(grey,("assets/rice.png"), name: 'Rice'),
    new Tile(grey,("assets/onion.png"), name: 'Onion'),
  ];

  var beverages = <Tile>[
    new Tile(grey,("assets/beer.png"), name: 'Beer'),
    new Tile(grey,("assets/coffee.png"), name: 'Coffee'),
    new Tile(grey,("assets/juice.png"), name: 'Juice'),
    new Tile(grey,("assets/coke.png"), name: 'Soft Drink'),
    new Tile(grey,("assets/tea.png"), name: 'Tea'),
  ];

  var snacksSweets = <Tile>[
    new Tile(grey,("assets/ice-cream.png"), name: 'Ice Cream'),
    new Tile(grey,("assets/chips.png"), name: 'Chips'),
    new Tile(grey,("assets/chocolate.png"), name: 'Chocolate'),
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
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
                background: Image.asset('assets/berrybanner1.png', fit: BoxFit.cover),
                
              ),
            )
          ];
        },
        body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GridView.count(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                crossAxisCount: 3,
                padding: const EdgeInsets.all(6),
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                childAspectRatio: 1,
                children: List.generate(addedToList.length, (index) {
                  return GridTile(
                    child: Tile(
                      grey,
                      addedToList[index].img, 
                      name: addedToList[index].name,
                    )
                  );
                },
                )
              ),
              ExpansionTile(
                title: Text("Recently Used", style: GoogleFonts.mavenPro(fontSize: 20)),
                // leading: Icon(Icons.child_care),
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("BANANA", style: GoogleFonts.mavenPro(fontSize: 20, fontWeight: FontWeight.bold),),
                      Container(width: 100, child: Image.asset("assets/banana.png"))
                    ],
                  )
                ],
                backgroundColor: Colors.white,
                initiallyExpanded: false,
              ),
              ExpansionTile(
                title: Text("Fruits and Vegetables", style: GoogleFonts.mavenPro(fontSize: 20)),
                // leading: Icon(Icons.child_care),
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
                          grey,
                          fruitsVegetables[index].img, 
                          name: fruitsVegetables[index].name,
                        )
                      );
                    },
                    )
                  ),
                ],
                backgroundColor: Colors.white,
                initiallyExpanded: false,
              ),
              ExpansionTile(
                title: Text("Meat and Fish", style: GoogleFonts.mavenPro(fontSize: 20)),
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
                          grey,
                          meatFish[index].img, 
                          name: meatFish[index].name,
                        )
                      );
                    },
                    )
                  ),
                ],
                backgroundColor: Colors.white,
                initiallyExpanded: false,
              ),
              ExpansionTile(
                title: Text("Dairy", style: GoogleFonts.mavenPro(fontSize: 20)),
                // leading: Icon(Icons.child_care),
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
                          grey,
                          dairy[index].img, 
                          name: dairy[index].name,
                        )
                      );
                    },
                    )
                  ),
                ],
                backgroundColor: Colors.white,
                initiallyExpanded: false,
              ),

              ExpansionTile(
                title: Text("Dry Goods", style: GoogleFonts.mavenPro(fontSize: 20)),
                // leading: Icon(Icons.child_care),
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
                          grey,
                          dryGoods[index].img, 
                          name: dryGoods[index].name,
                        )
                      );
                    },
                    )
                  ),
                ],
                backgroundColor: Colors.white,
                initiallyExpanded: false,
              ),

              ExpansionTile(
                title: Text("Snacks and Sweets", style: GoogleFonts.mavenPro(fontSize: 20)),
                // leading: Icon(Icons.child_care),
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
                          grey,
                          snacksSweets[index].img, 
                          name: snacksSweets[index].name,
                        )
                      );
                    },
                    )
                  ),
                ],
                backgroundColor: Colors.white,
                initiallyExpanded: false,
              ),

              ExpansionTile(
                title: Text("Beverages", style: GoogleFonts.mavenPro(fontSize: 20)),
                // leading: Icon(Icons.child_care),
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
                          grey,
                          beverages[index].img, 
                          name: beverages[index].name,
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

      ),
    );
  }
}
