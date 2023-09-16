import 'package:flutter/material.dart';

import '../../model/blog.dart';
import '../../services/blog_service/blog_service.dart';

class BlogModel extends ChangeNotifier {
  BlogModel();

  final _blogService = BlogService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasMore = true;
  bool get hasMore => _hasMore;

  bool _isRefreshing = false;
  bool get isRefreshing => _isRefreshing;

  bool _isLoadMore = false;
  bool get isLoadMore => _isLoadMore;

  List<Blog> _blogs = [];
  List<Blog> get blogs => _blogs;

  int _currentPage = 1;

  Future<void> getBlogs() async {
    _blogs = [];
    _isLoading = true;
    notifyListeners();

    final data = await _blogService.getBlogs(page: _currentPage);

    _blogs = data;
    _isLoading = false;
    _hasMore = data.isNotEmpty;
    notifyListeners();
  }

  Future<void> getMoreBlogs() async {
    if (_isLoadMore) {
      return;
    }

    _isLoadMore = true;
    notifyListeners();

    _currentPage++;
    final data = await _blogService.getBlogs(page: _currentPage);

    _blogs.addAll(data);
    _isLoadMore = false;
    _hasMore = data.isNotEmpty;
    notifyListeners();
  }

  Future<void> refreshBlog() async {
    _isRefreshing = true;
    notifyListeners();

    _currentPage = 1;
    final data = await _blogService.getBlogs(page: _currentPage);

    _blogs = data;
    _isRefreshing = false;
    _hasMore = data.isNotEmpty;
    notifyListeners();
  }
}
