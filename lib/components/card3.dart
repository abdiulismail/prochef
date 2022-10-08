import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:prochef/prochef_theme.dart';

import '../models/explore_recipe.dart';

class Card3 extends StatelessWidget {
  final ExploreRecipe recipe;

  const Card3({
    super.key,
    required this.recipe,
  });

  final String category = 'Editors choice';
  final String title = 'the art of dough';
  final String description = 'learn to make the perfect bread';
  final String chef = 'abdullahi';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 350, height: 650),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/mag5.png'), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            //add dark overlay boxdecoration
            Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Recipe Trends',
                    style: ProChefTheme.darkTextTheme.headline6,
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
            //add center widget with chip widget children
            Center(
              child: Wrap(
                alignment: WrapAlignment.start,
                runSpacing: 10,
                children: [
                  Chip(
                    label: Text(
                      'healthy',
                      style: ProChefTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('deleted');
                    },
                  ),
                  Chip(
                    label: Text(
                      'vegan',
                      style: ProChefTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('deleted');
                    },
                  ),
                  Chip(
                    label: Text(
                      'carrots',
                      style: ProChefTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('deleted');
                    },
                  ),
                  Chip(
                    label: Text(
                      'greens',
                      style: ProChefTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('deleted');
                    },
                  ),
                  Chip(
                    label: Text(
                      'wheat',
                      style: ProChefTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('deleted');
                    },
                  ),
                  Chip(
                    label: Text(
                      'mangoes',
                      style: ProChefTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('deleted');
                    },
                  ),
                  Chip(
                    label: Text(
                      'lemon',
                      style: ProChefTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('deleted');
                    },
                  ),
                  Chip(
                    label: Text(
                      'cabbage',
                      style: ProChefTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('deleted');
                    },
                  ),
                  Chip(
                    label: Text(
                      'matoke',
                      style: ProChefTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('deleted');
                    },
                  ),
                  Chip(
                    label: Text(
                      'healthy',
                      style: ProChefTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('deleted');
                    },
                  ),
                  Chip(
                    label: Text(
                      'vegan',
                      style: ProChefTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('deleted');
                    },
                  ),
                  Chip(
                    label: Text(
                      'carrots',
                      style: ProChefTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('deleted');
                    },
                  ),
                  Chip(
                    label: Text(
                      'greens',
                      style: ProChefTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('deleted');
                    },
                  ),
                  Chip(
                    label: Text(
                      'wheat',
                      style: ProChefTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('deleted');
                    },
                  ),
                  Chip(
                    label: Text(
                      'mangoes',
                      style: ProChefTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('deleted');
                    },
                  ),
                  Chip(
                    label: Text(
                      'lemon',
                      style: ProChefTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('deleted');
                    },
                  ),
                  Chip(
                    label: Text(
                      'cabbage',
                      style: ProChefTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('deleted');
                    },
                  ),
                  Chip(
                    label: Text(
                      'matoke',
                      style: ProChefTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('deleted');
                    },
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
