import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/post.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => Post.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
