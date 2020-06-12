import 'package:flutter/material.dart';
import 'package:leeks/Recipe.dart';
import 'package:leeks/Widgets/Tiles.dart';



Color themePurple = Color(0xff9179e0);
Color duskyPurple = Color(0xffdbd2f7);
Color themeRed = Color(0xfff26b57);
Color duskyRed = Color(0xfff8b1a6);

List<Color> unselectedCat = [duskyRed, duskyPurple, Colors.grey[400]];
List<Color> selectedCat = [themeRed, themePurple, Colors.grey[700]];
List<Color> appBar = [themeRed, themePurple, Colors.grey[800]];
List<Color> bg = [Colors.white, Colors.white, Colors.grey[850]];
List<Color> words = [Colors.grey[700], Colors.grey[700], Colors.grey[50]];
List<Color> navBarText = [themeRed, themePurple, Colors.white];
List<Color> navActive = [themeRed, themePurple, Colors.grey[100]];
Color tileOff = Colors.grey[200];
Color tileOn = Color(0xfff69a8c);

List<Tile> cheesyPastaIngredients = [
  Tile("proxy", "Olive Oil", details: "4 tbsp", smaller: true,),
  Tile("assets/meat.png", "Beef", details: "lean, ground", smaller: true,),
  Tile("assets/tomato.png", "Tomato", details: "pureed", smaller: true,),
  Tile("proxy", "Basil", smaller: true,),
  Tile("assets/cheese.png", "Cheese", details: "mozzarella", smaller: true,),
];

List<Tile> vanillaMuffinIngredients = [
  Tile("assets/flour.png", "Flour", details: "4 cups", smaller: true,),
  Tile("assets/milk.png", "Milk", details: "2 cups", smaller: true,),
  Tile("proxy", "Sugar", details: "2 cups", smaller: true,),
  Tile("assets/eggs.png", "Eggs", details: "2 large", smaller: true,)
];

List<Recipe> recipeList = [
  new Recipe("Fudge Brownies", description: "Fudgey and moist", ingredients: dairy, image: Image.asset("assets/brownies.jpeg", height: 150, fit: BoxFit.cover),),
  new Recipe("Vanilla Muffins", description: "beautiful, 10/10", ingredients: vanillaMuffinIngredients, image: Image.asset("assets/vanillamuffins.jpg", height: 150, fit: BoxFit.cover)),
  new Recipe("Cheese Baked Pasta", description: "peterson's favorite!", ingredients: cheesyPastaIngredients, image: Image.asset("assets/cheeseypasta.jpg", height: 150, fit: BoxFit.cover)),
  new Recipe("Charred Lemon Chicken", description: "Easy 5min", ingredients: dairy, image: Image.asset("assets/lemonchicken.jpg", height: 150, fit: BoxFit.cover))

];


var fruitsVegetables = <Tile>[
  new Tile(("assets/banana.png"), 'Banana'),
  new Tile(("assets/broccoli.png"), 'Broccoli'),
  new Tile('assets/cauliflower.png', 'Cauliflower'),
  new Tile('assets/carrot.png', 'Carrot'),
  new Tile('assets/coconut.png', 'Coconut'),
  new Tile('assets/corn.png', 'Corn'),
  new Tile('assets/pepper.png', 'Capsicum'),
  new Tile(("assets/cherries.png"), 'Cherry'),
  new Tile('assets/lemon.png', 'Lemon'),
  new Tile(("assets/mushroom.png"), 'Mushroom'),
  new Tile('assets/orange.png', 'Orange'),
  new Tile('assets/pineapple.png', 'Pineapple'),
  new Tile('assets/potato.png', 'Potatoes'),
  new Tile('assets/strawberry.png', 'Strawberry'),
  new Tile('assets/tomato.png', 'Tomato'),
  new Tile('assets/watermelon.png', 'Watermelon')
];

var meatFish = <Tile>[
  new Tile(("assets/meat.png"), 'Beef'),
  new Tile(("assets/chicken.png"), 'Chicken'),
  new Tile('assets/crab.png', 'Crab'),
  new Tile(("assets/fish.png"), 'Fish'),
  new Tile(("assets/lobster.png"), 'Lobster'),
  new Tile("assets/pork.png", "Pork"),
  new Tile('assets/sausage.png', 'Sausage'),
  new Tile("assets/shrimp.png", "Shrimp")
];

var dairy = <Tile>[
  new Tile(("assets/butter.png"), 'Butter'),
  new Tile(("assets/cheese.png"), 'Cheese'),
  new Tile(("assets/eggs.png"), 'Eggs'),
  new Tile(("assets/milk.png"), 'Milk'),
  new Tile('assets/yogurt.png', 'Yoghurt'),
];

var dryGoods = <Tile>[
  new Tile(("assets/bread.png"), 'Bread'),
  new Tile(("assets/croissant.png"), 'Croissant'),
  new Tile(("assets/donut.png"), 'Donut'),
  new Tile(("assets/flour.png"), 'Flour'),
  new Tile(("assets/noodles.png"), 'Noodles'),
  new Tile(("assets/onion.png"), 'Onion'),
  new Tile(("assets/rice.png"), 'Rice'),
  new Tile(("assets/waffle.png"), 'Waffle'),
];

var beverages = <Tile>[
  new Tile(("assets/beer.png"), 'Beer'),
  new Tile(("assets/coffee.png"), 'Coffee'),
  new Tile(("assets/juice.png"), 'Juice'),
  new Tile(("assets/liquor.png"), 'Liquor'),
  new Tile(("assets/coke.png"), 'Soft Drink'),
  new Tile(("assets/tea.png"), 'Tea'),
  new Tile("assets/virus.png", 'Corona Beer'),
];

var snacksSweets = <Tile>[
  new Tile(("assets/ice-cream.png"), 'Ice Cream'),
  new Tile(("assets/chips.png"), 'Chips'),
  new Tile(("assets/chocolate.png"), 'Chocolate'),
  new Tile(("assets/jam.png"), 'Jam'),
  new Tile(("assets/peanutbutter.png"), 'PB'),
];


var allItems =
    fruitsVegetables + meatFish + dairy + dryGoods + snacksSweets + beverages;


