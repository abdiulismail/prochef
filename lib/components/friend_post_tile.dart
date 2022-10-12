import 'package:flutter/material.dart';
import 'package:prochef/components/circle_image.dart';
import 'package:prochef/models/models.dart';

class FriendPostTile extends StatelessWidget {
  final Post post;

  FriendPostTile({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleImage(
          imageProvider: AssetImage(post.profileImageUrl),
          imageRadius: 20,
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.comment),
              Text(
                '${post.timestamp} min ago',
                style: TextStyle(fontWeight: FontWeight.w700),
              )
            ],
          ),
        )
      ],
    );
  }
}
