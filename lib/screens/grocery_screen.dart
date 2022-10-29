import 'package:flutter/material.dart';
import 'package:prochef/models/models.dart';
import 'package:prochef/screens/empty_grocery_screen.dart';
import 'package:prochef/screens/grocery_list_screen.dart';
import 'package:provider/provider.dart';

import 'grocery_item_screen.dart';

class GroceryScreen extends StatelessWidget {
  GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //present groceryitemscreen
          final manager = Provider.of<GroceryManager>(context, listen: false);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GroceryItemScreen(
                        onCreate: (item) {
                          manager.addItem(item);
                          Navigator.pop(context);
                        },
                        onUpdate: (item) {},
                      )));
        },
      ),
      body: buildGroceryScreen(),
    );
  }

  //todo add buildGroceryScreen
  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(builder: (context, manager, child) {
      if (manager.groceryItems.isNotEmpty) {
        //add grocerylistscreen
        return GroceryListScreen(manager: manager);
      } else {
        return EmptyGroceryScreen();
      }
    });
  }
}
