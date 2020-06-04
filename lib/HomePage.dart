import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:leeks/Widgets/Tiles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  var tiles = <Tile>[
    new Tile('Meat', grey, ("assets/meat.png"), name: 'Beef'),
    new Tile('Fruits', grey, ("assets/apple.png"), name: 'Apple'),
    new Tile('Dry Goods', grey, ("assets/flour.png"), name: 'Flour'),
    new Tile('Vegetable', grey, ("assets/broccoli.png"), name: 'Broccoli'),
    new Tile('Dairy', grey, ("assets/cheese.png"), name: 'Cheese'),
    new Tile('Dairy', grey, ("assets/milk.png"), name: 'Milk'),
    new Tile('Dry Goods', grey, ("assets/noodles.png"), name: 'Noodles'),


    new Tile('Dairy', grey, ("assets/lobster.png"), name: 'Fish'),
    new Tile('Dairy', grey, ("assets/beer.png"), name: 'Fish'),
    new Tile('Dairy', grey, ("assets/bread.png"), name: 'Fish'),
    new Tile('Dairy', grey, ("assets/fish.png"), name: 'Fish'),
    new Tile('Dairy', grey, ("assets/fish.png"), name: 'Fish'),
    new Tile('Dairy', grey, ("assets/fish.png"), name: 'Fish'),
    new Tile('Dairy', grey, ("assets/fish.png"), name: 'Fish'),
    new Tile('Dairy', grey, ("assets/fish.png"), name: 'Fish'),



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
                titlePadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                centerTitle: true,
                title: Container(
                  width: MediaQuery.of(context).size.width * 0.63,
                  child: CupertinoTextField(
                    keyboardType: TextInputType.text,
                    placeholder: "Buy what shit",
                    placeholderStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                    prefix: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Icon(Icons.search, color: Colors.grey),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
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
                  // children: List.generate(12, (index) {
                  //   return GridTile(
                  //     child: Tile(category: 'Meat', name: 'Beef', bg: Colors.grey),
                  //   );
                  // }),
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
