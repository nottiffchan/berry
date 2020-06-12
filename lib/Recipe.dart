import 'dart:io';
import 'package:flutter/material.dart';
import 'package:leeks/Widgets/Tiles.dart';
import 'package:leeks/constants.dart';
import 'package:leeks/groceryList.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class Recipe extends StatefulWidget {
  String title;
  String description;
  List<Tile> ingredients;
  Image image;

  Recipe(this.title, {this.image, this.description, this.ingredients});

  @override
  _RecipeState createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  File imgFile;

  Widget gridFormation(List<Tile> list) {
    return GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 3,
      // padding: const EdgeInsets.all(6),
      crossAxisSpacing: 6,
      mainAxisSpacing: 6,
      childAspectRatio: 0.89,
      children: List.generate(list.length, (index) {
        return GridTile(
          child: Tile(
            list[index].img, 
            list[index].name,
            details: list[index].details,
            smaller: true,
          )
        );
      })
    );
  }


  @override
  Widget build(BuildContext context) {
    final groceryList grocerylist = Provider.of<groceryList>(context);  
    
    imageSelectorGallery() async {
      imgFile = await ImagePicker.pickImage(
        source: ImageSource.gallery,
      );
      setState(() {
        for (int i = 0; i < recipeList.length; i++) {
          if (recipeList[i].title == widget.title) {
            recipeList[i].image = Image.file(imgFile, height: 150, fit: BoxFit.cover);
          }
        }
      });
    }

    imageSelectorCamera() async {
      imgFile = await ImagePicker.pickImage(
        source: ImageSource.camera,
      );
      setState(() {
        for (int i = 0; i < recipeList.length; i++) {
          if (recipeList[i].title == widget.title) {
            recipeList[i].image = Image.file(imgFile, height: 150, fit: BoxFit.cover);
          }
        }
      });
    } 

    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.grey[800],), onPressed: () { Navigator.pop(context); } ,),
              actions: <Widget>[IconButton(icon: Icon(Icons.create, color: Colors.grey[800],), onPressed: () {},)],
              backgroundColor: Colors.white,
              expandedHeight: 225,
              elevation: 0,
              floating: false,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.symmetric(horizontal: 8, vertical: 9),
                centerTitle: true,
                background: widget.image == null ? Image.file(imgFile, fit: BoxFit.cover) : widget.image,
              ),
            )
          ];
        },
        body: Container(
          padding: EdgeInsets.all(25),
          child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.title, style: TextStyle(fontFamily: "FredokaOne", fontSize: 35, color: Colors.grey[800])),
                  SizedBox(height: 30),
                  Text(widget.description, style: TextStyle(fontFamily: "MavenPro", fontSize: 18)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: Container(
                      height:1.3,
                      width: MediaQuery.of(context).size.width,
                      color:Colors.black,
                    ),
                  ),
                  Text("Ingredients:", style: TextStyle(fontFamily: "MavenPro", fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[800])),
                  gridFormation(widget.ingredients),
                  SizedBox(height: 60),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      child: Text("Add Ingredients", style: TextStyle(fontFamily: "MavenPro", fontSize: 20)),
                      color: duskyRed,
                      onPressed: () {
                        for (int i = 0; i < widget.ingredients.length; i++) {
                          grocerylist.add(widget.ingredients[i]);
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      child: Text("Select Image from Gallery", style: TextStyle(fontFamily: "MavenPro", fontSize: 20)),
                      color: duskyRed,
                      onPressed: imageSelectorGallery,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      child: Text("Select Image from Camera", style: TextStyle(fontFamily: "MavenPro", fontSize: 20)),
                      color: duskyRed,
                      onPressed: imageSelectorCamera,
                    ),
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}