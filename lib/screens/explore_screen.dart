import 'package:flutter/material.dart';
import 'package:prochef/api/mock_fooderlich_service.dart';
import 'package:prochef/components/components.dart';

import '../models/explore_data.dart';

class ExploreScreen extends StatelessWidget {
  final mockservice = MockApiService();

  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockservice.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final recipes = snapshot.data?.todayRecipes ?? [];
          //replace this with todayrecipelistview
          return TodayRecipeListView(recipes: recipes);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
