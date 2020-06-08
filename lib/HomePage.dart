import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leeks/BrowseTiles.dart';
import 'package:leeks/ListofLists.dart';
import 'package:leeks/groceryList.dart';
import 'package:leeks/my_flutter_app_icons.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'my_flutter_app_icons.dart';
import 'package:leeks/Widgets/Tiles.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  PageController _pageController;

  Widget gridFormation(List<Tile> list) {
    return GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 3,
      padding: const EdgeInsets.all(6),
      crossAxisSpacing: 6,
      mainAxisSpacing: 6,
      childAspectRatio: 1,
      children: List.generate(list.length, (index) {
        return GridTile(
          child: Tile(
            list[index].img, 
            list[index].name,
          )
        );
      },
      )
    );
  }
  
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final groceryList grocerylist = Provider.of<groceryList>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          elevation: 0.5,
          backgroundColor: themePurple,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(60, 20))),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 10, 10),
                child: Image.asset('assets/berry-png-new.png', fit: BoxFit.contain, height: 45),
              ),
              Text("berry", style: TextStyle(color: Colors.white, fontFamily: "FredokaOne", fontSize: 38),)
            ],
          )
        ),
      ),


// BODY

        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            children: <Widget>[
              Container(
                child: grocerylist.inList.length == 0
                ? Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
                    child: Text("Nothing to buy!", style: TextStyle(fontFamily: "MavenPro",  fontSize: 25, color: navy),),
                  ),
                )
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: gridFormation(grocerylist.inList),
                )
              ),
              BrowseTiles(),
              ListofLists(),
              Center(child: Container(color: Colors.white, child: Text("settings/profile stuff????"))),
            ],
          ),
        ),


// BOTTOM NAVIGATION BAR

        bottomNavigationBar: BottomNavyBar(
          selectedIndex: currentIndex,
          showElevation: true, 
          onItemSelected: (index) {
            setState(() => currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: [
            BottomNavyBarItem(
              icon: Icon(MyFlutterApp.basket),
              title: Text('My List', style: TextStyle(fontFamily: "MavenPro", fontSize: 15),),
              inactiveColor: Colors.grey,
              activeColor: themePurple,
              textAlign: TextAlign.center
            ),
            BottomNavyBarItem(
                icon: Icon(MyFlutterApp.tile),
                title: Text('Browse',style: TextStyle(fontFamily: "MavenPro", fontSize: 15),),
                inactiveColor: Colors.grey,
                activeColor: themePurple,
                textAlign: TextAlign.center
            ),
            BottomNavyBarItem(
                icon: Icon(MyFlutterApp.list),
                title: Text('Lists', style: TextStyle(fontFamily: "MavenPro", fontSize: 15),),
                inactiveColor: Colors.grey,
                activeColor: themePurple,
                textAlign: TextAlign.center
            ),
            BottomNavyBarItem(
                icon: Icon(MyFlutterApp.settings),
                title: Text('Settings', style: TextStyle(fontFamily: "MavenPro", fontSize: 15),),
                inactiveColor: Colors.grey,
                activeColor: themePurple,
                textAlign: TextAlign.center,
            ),
          ],
        )
    );
  }
} 