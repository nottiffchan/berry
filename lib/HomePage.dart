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


  var tiles = <Tile>[
    new Tile('Meat', red, ("assets/meat.png"), name: 'Beef'),
    new Tile('Fruits', red, ("assets/banana.png"), name: 'Banana'),
    new Tile('Dry Goods', grey, ("assets/flour.png"), name: 'Flour'),
    new Tile('Vegetable', grey, ("assets/broccoli.png"), name: 'Broccoli'),
    new Tile('Dairy', grey, ("assets/cheese.png"), name: 'Cheese'),
    new Tile('Dairy', grey, ("assets/milk.png"), name: 'Milk'),
    new Tile('Dry Goods', red, ("assets/noodles.png"), name: 'Noodles'),


    new Tile('Dairy', red, ("assets/lobster.png"), name: 'Lobster'),
    new Tile('Dairy', grey, ("assets/beer.png"), name: 'Beer'),
    new Tile('Dairy', grey, ("assets/bread.png"), name: 'Bread'),
    new Tile('Dairy', grey, ("assets/fish.png"), name: 'Fish'),
    new Tile('Dairy', grey, ("assets/butter.png"), name: 'Butter'),
    new Tile('Dairy', grey, ("assets/eggs.png"), name: 'Eggs'),
    new Tile('Dairy', grey, ("assets/ice-cream.png"), name: 'Ice Cream'),
    new Tile('Dairy', grey, ("assets/mushroom.png"), name: 'Mushroom'),
    new Tile('Dairy', grey, ("assets/cherries.png"), name: 'Cherry'),
    new Tile('Dairy', grey, ("assets/chicken.png"), name: 'Chicken'),
    new Tile('Dairy', grey, ("assets/chips.png"), name: 'Chips'),
    new Tile('Dairy', grey, ("assets/chocolate.png"), name: 'Chocolate'),
    new Tile('Dairy', grey, ("assets/coffee.png"), name: 'Coffee'),
    new Tile('Dairy', grey, ("assets/coke.png"), name: 'Coke'),
    new Tile('Dairy', grey, ("assets/fruits.png"), name: 'Apple'),
    new Tile('Dairy', grey, ("assets/juice.png"), name: 'Apple Juice'),
    new Tile('Dairy', grey, ("assets/onion.png"), name: 'Onion'),
    new Tile('Dairy', grey, ("assets/rice.png"), name: 'Rice'),
    new Tile('Dairy', grey, ("assets/tea.png"), name: 'Tea'),



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
                background: Image.asset('assets/berrybanner1.png', fit: BoxFit.cover),
                
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
                    maxCrossAxisExtent:125,
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
                      )
                    );
                  }
                  ),
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
