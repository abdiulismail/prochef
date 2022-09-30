import 'package:flutter/material.dart';
import 'package:prochef/prochef_theme.dart';

class Card3 extends StatelessWidget {
  Card3({super.key});

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
              image: AssetImage('assets/mag3.png'), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
