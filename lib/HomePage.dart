import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:leeks/Widgets/Tiles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Tiles> tiles = [
    Tiles(),
    Tiles(),
    Tiles(),
    Tiles(),
    Tiles(),
    Tiles(),
    Tiles(),
    Tiles()
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
                title: Container(
                  width: MediaQuery.of(context).size.width * 0.63,
                  child: CupertinoTextField(
                    keyboardType: TextInputType.text,
                    placeholder: "Buy what fuck",
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
                background: Image.asset('assets/banner.png', fit: BoxFit.cover),
                
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
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 8,
                  ),
                  children: List.generate(12, (index) {
                    return GridTile(
                      child: Tiles(),
                    );
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
