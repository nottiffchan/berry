import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leeks/constants.dart';

class Tile extends StatefulWidget {
  final String name;
  final String img;
  Color bg = grey;

  Tile(this.bg, this.img, {this.name});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  Color c = grey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        color: widget.bg,
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
          widget.bg == grey ? widget.bg = red : widget.bg = grey;
        });
      },
    );

  }
}

//montserrat, muli, titilliumWeb, mavenPro