import 'package:flutter/material.dart';
import 'package:prochef/api/mock_fooderlich_service.dart';
import 'package:prochef/components/components.dart';
import 'package:prochef/models/models.dart';

class RecipeScreen extends StatelessWidget {
  final exploreService = MockApiService();

  RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exploreService.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          //todo add recipegridview here
          return RecipeGridView(recipes: snapshot.data ?? []);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
