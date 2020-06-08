import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leeks/constants.dart';
import 'package:leeks/groceryList.dart';
import 'package:provider/provider.dart';

class Tile extends StatefulWidget {
  final String img, name;
  final VoidCallback focus;
  final FocusNode fNode;

  Tile(this.img, this.name, {this.focus, this.fNode});

  @override
  TileState createState() => TileState();
}

class TileState extends State<Tile> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 300), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();
  }
  
  @override
  Widget build(BuildContext context) {
    final groceryList grocerylist = Provider.of<groceryList>(context);

    Tile t = new Tile(widget.img, widget.name);

    return InkWell(
        focusNode: widget.fNode,
        child: FadeTransition(opacity: animation,
          child: Container(
            decoration: BoxDecoration(
            color: grocerylist.imgList.contains(t.img) ? tileRed : Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
            ),
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
                          textStyle: TextStyle(
                            color: grocerylist.imgList.contains(t.img) ? Colors.white : Colors.grey[600], 
                            fontWeight: FontWeight.w600),
                          fontSize: 19,
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            )
          ),
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