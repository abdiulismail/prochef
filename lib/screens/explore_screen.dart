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
