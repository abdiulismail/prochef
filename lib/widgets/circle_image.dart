
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget{
  final double imageRadius;
  final ImageProvider? imageProvider;

  CircleImage({super.key, this.imageRadius = 20, this.imageProvider});

  @override
  Widget build(BuildContext context){
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageRadius,
      child: CircleAvatar(
        radius: imageRadius - 5,
        backgroundImage: imageProvider,
      ),
    );
  }
}