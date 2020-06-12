import 'package:flutter/material.dart';
import 'package:leeks/ShoppingList/screens/add_list_screen.dart';
import 'package:leeks/ShoppingList/screens/list_screen.dart';

class ListofLists extends StatefulWidget {
  @override
  _ListofListsState createState() => _ListofListsState();
}

class _ListofListsState extends State<ListofLists> {
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            // Expanded(
            //   flex: 4,
            //   child: Container(
            //     child: DrawerHeader(
            //       decoration: BoxDecoration(
            //         image: DecorationImage(
            //           image: AssetImage("assets/sidebarmenu.png"),
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Expanded(
              flex: 16,
              child: ListsScreen(),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: AddListScreen(),
                      ),
                    ),
                  );
                },
                child: Container(
                  color: Colors.grey[200],
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ),
                      Text(
                        "ADD LIST",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "MavenPro",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      
  }
}