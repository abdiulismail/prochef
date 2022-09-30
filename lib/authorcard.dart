
import 'package:flutter/material.dart';
import 'package:prochef/circle_image.dart';
import 'package:prochef/prochef_theme.dart';

class AuthorCard extends StatefulWidget{
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  AuthorCard({super.key, required this.authorName, required this.title, this.imageProvider});

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavoured = false;

  @override
  Widget build(BuildContext context){
    //todo replace container
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(
                imageProvider: widget.imageProvider,
                imageRadius: 28,
              ),
              const SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.authorName,
                    style: ProChefTheme.lightTextTheme.headline2,
                  ),
                  Text(
                    widget.title,
                    style: ProChefTheme.lightTextTheme.headline3,
                  )
                ],
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              _isFavoured ? Icons.favorite : Icons.favorite_border
            ),
            iconSize: 30,
            color: Colors.grey[400],
            onPressed: (){
              setState(() {
                _isFavoured = !_isFavoured;
              });
            },
          )
        ],
      ),
    );
  }
}