import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/post.dart';

class LocalStorageService {
  static const String key = 'posts_data';

  Future<void> savePosts(List<Post> posts) async {
    final prefs = await SharedPreferences.getInstance();
    final data = jsonEncode(posts.map((post) => {
      'id': post.id,
      'title': post.title,
      'body': post.body,
      'isRead': post.isRead,
      'timerDuration': post.timerDuration,
    }).toList());
    await prefs.setString(key, data);
  }

  Future<List<Post>> loadPosts() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(key);
    if (data != null) {
      final List<dynamic> jsonData = jsonDecode(data);
      return jsonData.map((item) => Post.fromJson(item)).toList();
    }
    return [];
  }
}
