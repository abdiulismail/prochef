import 'package:flutter/material.dart';
import 'package:prochef/prochef_theme.dart';

class Card1 extends StatelessWidget {
  Card1({super.key});

  final String category = 'Editors choice';
  final String title = 'the art of dough';
  final String description = 'learn to make the perfect bread';
  final String chef = 'abdullahi';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(width: 350, height: 650),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/mag1.png'), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            Text(
              category,
              style: ProChefTheme.darkTextTheme.bodyText1,
            ),
            Positioned(
                top: 20,
                child: Text(
                  title,
                  style: ProChefTheme.darkTextTheme.headline2,
                )),
            Positioned(
                bottom: 30,
                right: 0,
                child: Text(
                  description,
                  style: ProChefTheme.darkTextTheme.headline2,
                )),
            Positioned(
              bottom: 10,
              right: 0,
              child: Text(
                chef,
                style: ProChefTheme.darkTextTheme.bodyText1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
