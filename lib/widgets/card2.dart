import 'package:flutter/material.dart';
import 'package:prochef/prochef_theme.dart';

import '../models/explore_recipe.dart';
import 'author_card.dart';

class Card2 extends StatelessWidget {
  final ExploreRecipe recipe;

  const Card2({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 350, height: 650),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/mag2.png'), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          children: [
            AuthorCard(
              authorName: 'mike',
              title: 'smoothie',
              imageProvider: AssetImage('assets/author_katz.jpeg'),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Text(
                      'Recipe',
                      style: ProChefTheme.lightTextTheme.headline1,
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 16,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        'smoothies',
                        style: ProChefTheme.lightTextTheme.headline1,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
