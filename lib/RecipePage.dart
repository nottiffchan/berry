import 'dart:io';

import 'package:flutter/material.dart';
import 'package:leeks/Recipe.dart';
import 'package:leeks/constants.dart';
import 'package:leeks/groceryList.dart';
import 'package:provider/provider.dart';

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {

  Widget gridFormation() {
    return GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      padding: const EdgeInsets.all(6),
      crossAxisSpacing: 30,
      mainAxisSpacing: 30,
      childAspectRatio: 0.65,
      children: List.generate(recipeList.length, (index) {
        return GridTile(
          child: InkWell(
            onTap: () {
              openRecipe(context, recipeList[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(blurRadius: 9, color: Colors.grey.withOpacity(0.5))],
              ),
              child: Column(children: <Widget> [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)), 
                    child: recipeList[index].image == null ? Image.asset("assets/sidebarmenu.png", height: 150, fit: BoxFit.cover) : recipeList[index].image,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(recipeList[index].title, style: TextStyle(fontFamily: "MavenPro", fontSize: 19, fontWeight: FontWeight.w500),),
                  )
                ]
              ),
            ),
          ),
        );
      },
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final groceryList grocerylist = Provider.of<groceryList>(context);   
    int colorIndex = grocerylist.colorIndex;

    return Scaffold(
      backgroundColor: bg[colorIndex],
      
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("My Recipes", style: TextStyle(fontFamily: "MavenPro", fontSize: 28, color: words[colorIndex]), textAlign: TextAlign.start,),
                  FlatButton.icon(
                    icon: Icon(Icons.add, color: navBarText[colorIndex],), 
                    onPressed: () {}, 
                    label: Text("Add New", style: TextStyle(fontFamily: "MavenPro", color: navBarText[colorIndex], fontSize: 18, fontWeight: FontWeight.bold),))
                ],
              ),
              SizedBox(height: 10,),
              gridFormation(),
            ],
          ),
        ),
      ),
    );
  }
}

Future openRecipe(context, Recipe r) async {
  await Navigator.push(context, MaterialPageRoute(builder: (context) => Recipe(r.title, image: r.image, description: r.description, ingredients: r.ingredients,)));
}