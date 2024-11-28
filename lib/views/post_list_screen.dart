import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/post_viewmodel.dart';
import '../widgets/post_item.dart';

class PostListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: Consumer<PostViewModel>(
        builder: (context, postVM, child) {
          if (postVM.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: postVM.posts.length,
            itemBuilder: (context, index) {
              return PostItem(post: postVM.posts[index]);
            },
          );
        },
      ),
    );
  }
}
