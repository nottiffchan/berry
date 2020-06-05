import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leeks/constants.dart';
import 'package:leeks/groceryList.dart';
import 'package:provider/provider.dart';

class Tile extends StatefulWidget {
  final String img, name;

  Tile(this.img, this.name);

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  
  @override
  Widget build(BuildContext context) {
    final groceryList grocerylist = Provider.of<groceryList>(context);
    Tile t = new Tile(widget.img, widget.name);

    return InkWell(
        child: Container(
          color: grocerylist.imgList.contains(t.img) ? tileRed : tileGrey,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 15),
                child: Image.asset(widget.img),
                width: MediaQuery.of(context).size.width * 0.17,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      widget.name, 
                      style: GoogleFonts.mavenPro(
                        textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
              ),
            ]
          )
        ),

        onTap: () {
          setState(() {
            if (grocerylist.imgList.contains(t.img)) {
              grocerylist.remove(t);
              grocerylist.recentAdd(t);
              
            } else {
              grocerylist.add(t);
            }
          });
        },
    );

  }
}

//montserrat, muli, titilliumWeb, mavenPro