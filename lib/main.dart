import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/post_viewmodel.dart';
import 'views/post_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PostViewModel()..fetchPosts(),
      child: MaterialApp(
        title: 'Post Viewer',
        debugShowCheckedModeBanner: false, // Remove debug banner
        home: PostListScreen(),
      ),
    );
  }
}
