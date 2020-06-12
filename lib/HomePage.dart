import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leeks/BrowseTiles.dart';
import 'package:leeks/ListofLists.dart';
import 'package:leeks/RecipePage.dart';
import 'package:leeks/groceryList.dart';
import 'package:leeks/my_flutter_app_icons.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'my_flutter_app_icons.dart';
import 'package:leeks/Widgets/Tiles.dart';

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

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
      childAspectRatio: 0.89,
      children: List.generate(list.length, (index) {
        return GridTile(
          child: Tile(
            list[index].img, 
            list[index].name,
            details: list[index].details,
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

  Widget settingsPage() {
    final groceryList grocerylist = Provider.of<groceryList>(context);

    return Container(
      padding: EdgeInsets.all(30),
      height: 40,
      child: ListView(
        children: <Widget>[
          Row(children: <Widget> [
            Container(
              padding: EdgeInsets.only(right: 30),
              child: Text("Themes >", style: TextStyle(fontFamily: "MavenPro", fontSize: 20, color: words[grocerylist.colorIndex]))
            ),
            InkWell(
              onTap: () {
                setState(() {
                  grocerylist.changeCol(0);
                });
              },
              child: Container(
                width: 40.0,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: appBar[0],
                ),
              ),
            ),
            SizedBox(width: 20),
            InkWell(
              onTap: () {
                setState(() {
                  grocerylist.changeCol(1);
                });
              },
              child: Container(
                width: 40.0,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: themePurple,
                ),
              ),
            ),
            SizedBox(width: 20),
            InkWell(
              onTap: () {
                setState(() {
                  grocerylist.changeCol(2);
                });
              },
              child: Container(
                width: 40.0,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: Colors.grey[500],
                ),
              ),
            )
          ]
            ),
            SizedBox(height: 20,),
            Container(
                  padding: EdgeInsets.only(right: 30),
                  child: Text("Number of recent items >", style: TextStyle(fontFamily: "MavenPro", fontSize: 20, color: words[grocerylist.colorIndex]))
                ),
            SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.red[700],
                  inactiveTrackColor: Colors.red[100],
                  trackShape: RoundedRectSliderTrackShape(),
                  trackHeight: 4.0,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  thumbColor: Colors.redAccent,
                  overlayColor: Colors.red.withAlpha(32),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                  tickMarkShape: RoundSliderTickMarkShape(),
                  activeTickMarkColor: Colors.red[700],
                  inactiveTickMarkColor: Colors.red[100],
                  valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                  valueIndicatorColor: Colors.redAccent,
                  valueIndicatorTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              child: Slider(
                min: 9,
                max: 21,
                divisions: 12,
                value: grocerylist.maxRecentItems.toDouble(),
                label: grocerylist.maxRecentItems.toString(),
                onChanged: (value) {
                  setState(() {
                    grocerylist.maxRecentItems = value.toInt();
                  });
                },
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final groceryList grocerylist = Provider.of<groceryList>(context);
    int colorIndex = grocerylist.colorIndex;

    return Scaffold(
      backgroundColor: bg[colorIndex],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          elevation: 0,
          backgroundColor: appBar[colorIndex],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(60, 20))),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("berry", style: TextStyle(color: Colors.white, fontFamily: "FredokaOne", fontSize: 40, letterSpacing: 1.12),)
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
                    child: Text("Nothing to buy!", style: TextStyle(fontFamily: "MavenPro", fontSize: 25, color: words[colorIndex]),),
                  ),
                )
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: gridFormation(grocerylist.inList),
                )
              ),
              BrowseTiles(),
              // ListofLists(),
              RecipePage(),
              settingsPage(),
            ],
          ),
        ),


// BOTTOM NAVIGATION BAR

        bottomNavigationBar: BottomNavyBar(
          backgroundColor: bg[colorIndex],
          selectedIndex: currentIndex,
          showElevation: true, 
          onItemSelected: (index) {
            setState(() => currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: [
            BottomNavyBarItem(
              icon: Icon(MyFlutterApp.basket),
              title: Text('My List', style: TextStyle(fontFamily: "MavenPro", fontSize: 15, color: navBarText[grocerylist.colorIndex])),
              inactiveColor: Colors.grey,
              // activeColor: appBar[grocerylist.colorIndex],
              activeColor: navActive[grocerylist.colorIndex],
              textAlign: TextAlign.center
            ),
            BottomNavyBarItem(
                icon: Icon(MyFlutterApp.tile),
                title: Text('Browse',style: TextStyle(fontFamily: "MavenPro", fontSize: 15, color: navBarText[grocerylist.colorIndex])),
                inactiveColor: Colors.grey,
                activeColor: navActive[grocerylist.colorIndex],
                textAlign: TextAlign.center
            ),
            BottomNavyBarItem(
                icon: Icon(MyFlutterApp.list),
                title: Text('My Recipes', style: TextStyle(fontFamily: "MavenPro", fontSize: 15, color: navBarText[grocerylist.colorIndex])),
                inactiveColor: Colors.grey,
                activeColor: navActive[grocerylist.colorIndex],
                textAlign: TextAlign.center
            ),
            BottomNavyBarItem(
                icon: Icon(MyFlutterApp.settings),
                title: Text('Settings', style: TextStyle(fontFamily: "MavenPro", fontSize: 15, color: navBarText[grocerylist.colorIndex])),
                inactiveColor: Colors.grey,
                activeColor: navActive[grocerylist.colorIndex],
                textAlign: TextAlign.center,
            ),
          ],
        )
    );
  }
} 