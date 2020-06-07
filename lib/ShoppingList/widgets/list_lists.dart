import 'package:flutter/material.dart';
import 'package:leeks/ShoppingList/widgets/list_tile.dart';
import 'package:provider/provider.dart';
import 'package:leeks/ShoppingList/shoppinglist/ListData.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListData>(
      builder: (context, ListData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final list = ListData.shoppinglists[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ShoppingListTile(
                listTitle: list.name,
                longPressCallback: () {
                  ListData.deleteTask(list);
                },
              ),
            );
          },
          itemCount: ListData.shoppinglists.length,
        );
      },
    );
  }
}
