import 'package:flutter/material.dart';
import 'package:prochef/screens/grocery_item_screen.dart';
import 'package:prochef/widgets/components.dart';

import '../models/models.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager manager;

  GroceryListScreen({super.key, required this.manager});

  @override
  Widget build(BuildContext context) {
    //replace with listview
    final groceryItems = manager.groceryItems;
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView.separated(
          itemBuilder: (context, index) {
            final item = groceryItems[index];
            //wrap in a dismissable

            //wrap in an inkwell
            return Dismissible(
              key: Key(item.id),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
              onDismissed: (direction) {
                manager.deleteItem(index);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${item.name} deleted')));
              },
              child: InkWell(
                child: GroceryTile(
                  item: item,
                  key: Key(item.id),
                  onComplete: (change) {
                    if (change != null) {
                      manager.completeItem(index, change);
                    }
                  },
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GroceryItemScreen(
                              originalItem: item,
                              onCreate: (item) {},
                              onUpdate: (item) {
                                manager.updateItem(item, index);
                                Navigator.pop(context);
                              })));
                },
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 16.0,
            );
          },
          itemCount: groceryItems.length),
    );
  }
}
