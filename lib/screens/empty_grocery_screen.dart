import 'package:flutter/material.dart';
import 'package:prochef/models/models.dart';
import 'package:provider/provider.dart';

class EmptyGroceryScreen extends StatelessWidget {
  EmptyGroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //todo add empty image
          Flexible(
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset('assets/empty_list.png'),
            ),
          ),
          Text(
            'No groceries',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            'shopping for ingredients ? \n'
            'Tap the + button to write them down',
            textAlign: TextAlign.center,
          ),
          MaterialButton(
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            color: Colors.green,
            onPressed: () {
              Provider.of<TabManager>(context, listen: false).goToRecipes();
            },
            child: Text('Browse Recipes'),
          )
        ]),
      ),
    );
  }
}
