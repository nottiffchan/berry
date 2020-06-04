import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  final String category, name;
  final Color bg;
  final String img;

  const Tile(this.category, this.bg, this.img, {this.name});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.bg,
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: Image.asset(widget.img),
            width: MediaQuery.of(context).size.width * 0.15,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // Text(widget.category),
                Text(widget.name),
              ],
            ),
          ),
        ]
      )
    );
  }
}