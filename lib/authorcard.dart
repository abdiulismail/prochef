
import 'package:flutter/material.dart';
import 'package:prochef/circle_image.dart';
import 'package:prochef/prochef_theme.dart';

class AuthorCard extends StatelessWidget{
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  AuthorCard({super.key, required this.authorName, required this.title, this.imageProvider});

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
                imageProvider: imageProvider,
                imageRadius: 28,
              ),
              const SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authorName,
                    style: ProChefTheme.lightTextTheme.headline2,
                  ),
                  Text(
                    title,
                    style: ProChefTheme.lightTextTheme.headline3,
                  )
                ],
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.favorite_border),
            iconSize: 30,
            color: Colors.grey[400],
            onPressed: (){
              var snackbar = SnackBar(content: Text('favourite'));
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            },
          )
        ],
      ),
    );
  }
}