import 'package:flutter/material.dart';
import 'package:prochef/components/components.dart';
import 'package:prochef/models/models.dart';

class RecipeGridView extends StatelessWidget {
  final List<SimpleRecipe> recipes;

  RecipeGridView({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: GridView.builder(
        itemCount: recipes.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final simpleRecipe = recipes[index];
          return RecipeThumbnail(recipe: simpleRecipe);
        },
      ),
    );
  }
}
