import 'package:flutter/material.dart';
import 'package:prochef/api/mock_fooderlich_service.dart';

import '../models/explore_data.dart';
import '../widgets/friend_post_list_view.dart';
import '../widgets/today_recipe_list_view.dart';

class ExploreScreen extends StatelessWidget {
  final mockservice = MockApiService();

  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockservice.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
              SizedBox(
                height: 16,
              ),
              //replace this with friendPostListView
              FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? [])
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
