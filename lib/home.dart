import 'package:flutter/material.dart';
import 'package:prochef/models/models.dart';
import 'package:prochef/screens/explore_screen.dart';
import 'package:prochef/screens/grocery_screen.dart';
import 'package:prochef/screens/recipes_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipeScreen(),
    GroceryScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (context, tabManager, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'ProChef',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        //show selected tab
        body: IndexedStack(
          index: tabManager.selectedTab,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          currentIndex: tabManager.selectedTab,
          onTap: (index) {
            tabManager.goToTab(index);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard), label: 'Card'),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard), label: 'Card2'),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard), label: 'Card3'),
          ],
        ),
      );
    });
  }
}
