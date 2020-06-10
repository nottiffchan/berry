import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:leeks/constants.dart';
import 'package:leeks/groceryList.dart';
import 'package:provider/provider.dart';

class Tile extends StatefulWidget {
  final String img, name;
  final VoidCallback focus;
  final FocusNode fNode;
  String details;

  Tile(this.img, this.name, {this.details = "‏‏‎　", this.focus, this.fNode});

  @override
  TileState createState() => TileState();
}

class TileState extends State<Tile> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;



  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 300), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();
  }
  
  @override
  Widget build(BuildContext context) {
    final groceryList grocerylist = Provider.of<groceryList>(context);

    Tile t = new Tile(widget.img, widget.name, details: widget.details,);

    return InkWell(
        focusNode: widget.fNode,
        child: FadeTransition(opacity: animation,
          child: Container(
            decoration: BoxDecoration(
            color: grocerylist.imgList.contains(t.img) ? tileOn : tileOff,
            borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Image.asset(widget.img),
                  width: MediaQuery.of(context).size.width * 0.17,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        widget.name, style: TextStyle(
                          fontFamily: "MavenPro",
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                          color: grocerylist.imgList.contains(t.img) ? Colors.white : Colors.grey[600],
                          )
                      ),
                      Text(widget.details, style: TextStyle(
                          fontFamily: "MavenPro",
                          fontSize: 16,
                          color: grocerylist.imgList.contains(t.img) ? Colors.white : Colors.grey[600],
                          )
                      ),
                      // widget.details == null ?
                      // Text("") :
                      // Text(grocerylist.curr.details, style: TextStyle(
                      //     fontFamily: "MavenPro",
                      //     fontSize: 16,
                      //     color: grocerylist.imgList.contains(t.img) ? Colors.white : Colors.grey[600],
                      //     )
                      // ),
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
              grocerylist.detailsChange(false);
              grocerylist.remove(t);
              grocerylist.recentAdd(t);
              
            } else {
              grocerylist.detailsChange(true);
              grocerylist.addCurrTile(t);
              // t.details = grocerylist.curr.details;
              grocerylist.add(t);
              // print(t.details);
            }
            
          });
        },
    );

  }
}

//montserrat, muli, titilliumWeb, mavenPro