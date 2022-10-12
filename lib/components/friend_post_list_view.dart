import 'package:flutter/material.dart';
import 'package:prochef/components/components.dart';
import 'package:prochef/models/models.dart';

class FriendPostListView extends StatelessWidget {
  final List<Post> friendPosts;

  FriendPostListView({super.key, required this.friendPosts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'social chefs',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 16,
          ),
          ListView.separated(
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: friendPosts.length,
            itemBuilder: (context, index) {
              final post = friendPosts[index];
              return FriendPostTile(post: post);
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 16,
              );
            },
          ),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
