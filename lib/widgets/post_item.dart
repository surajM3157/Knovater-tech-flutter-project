import 'package:flutter/material.dart';
import '../models/post.dart';
import '../views/post_detail_screen.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({required this.post});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: post.isRead ? Colors.white : Colors.yellow[100],
      title: Text(post.title),
      trailing: Icon(Icons.timer),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetailScreen(post: post), // Navigate with data
          ),
        );
      },
    );
  }
}
