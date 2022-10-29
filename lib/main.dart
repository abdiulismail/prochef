import 'package:flutter/material.dart';
import 'package:prochef/home.dart';
import 'package:prochef/models/models.dart';
import 'package:prochef/prochef_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ProChef());
}

class ProChef extends StatelessWidget {
  const ProChef({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final myTheme = ProChefTheme.light();
    //apply home widget

    return MaterialApp(
      theme: myTheme,
      title: 'ProChef',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabManager()),
          ChangeNotifierProvider(create: (context) => GroceryManager()),
        ],
        child: Home(),
      ),
    );
  }
}
