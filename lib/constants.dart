import 'package:flutter/material.dart';
import 'package:leeks/Widgets/Tiles.dart';



Color themePurple = Color(0xff9179e0);
Color duskyPurple = Color(0xffdbd2f7);
Color themeRed = Color(0xfff26b57);
Color duskyRed = Color(0xfff8b1a6);

List<Color> unselectedCat = [duskyRed, duskyPurple];
List<Color> selectedCat = [themeRed, themePurple];
List<Color> appBar = [themeRed, themePurple];
List<Color> bg = [Colors.white, Colors.white, Colors.grey[700]];
Color tileOff = Colors.grey[200];
Color tileOn = Color(0xfff69a8c);


var fruitsVegetables = <Tile>[
  new Tile(("assets/banana.png"), 'Banana'),
  new Tile(("assets/broccoli.png"), 'Broccoli', details: "hahha",),
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
  new Tile(("assets/eggs.png"), 'Eggs'),
  new Tile(("assets/fish.png"), 'Fish'),
  new Tile(("assets/lobster.png"), 'Lobster'),
  new Tile("assets/pork.png", "Pork"),
  new Tile('assets/sausage.png', 'Sausage'),
  new Tile("assets/shrimp.png", "Shrimp")
];

var dairy = <Tile>[
  new Tile(("assets/butter.png"), 'Butter'),
  new Tile(("assets/cheese.png"), 'Cheese'),
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
