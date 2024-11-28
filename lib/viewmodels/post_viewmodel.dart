import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/api_service.dart';
import '../services/local_storage_service.dart';

class PostViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final LocalStorageService _localStorageService = LocalStorageService();

  List<Post> _posts = [];
  List<Post> get posts => _posts;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> fetchPosts() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Load from local storage first
      _posts = await _localStorageService.loadPosts();

      // Fetch from API and update local storage
      final apiPosts = await _apiService.fetchPosts();
      _posts = apiPosts;
      await _localStorageService.savePosts(_posts);
    } catch (e) {
      print('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void markAsRead(Post post) {
    post.isRead = true;
    notifyListeners();
    _localStorageService.savePosts(_posts);
  }
}
