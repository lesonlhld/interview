import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interview/common/constant/server_config.dart';

import '../../model/blog.dart';

class BlogService {
  String _addParam(String url, {String? param, String? value}) {
    if (param?.isNotEmpty ?? false) {
      if (url.contains('?')) {
        url += '&$param';
      } else {
        url += '?$param';
      }

      if (value?.isNotEmpty ?? false) {
        url += '=$value';
      }
    }
    return url;
  }

  Future<List<Blog>> getBlogs({
    int? page,
    int? perPage,
    String? order,
    String? orderBy,
  }) async {
    var list = <Blog>[];
    try {
      var url = '$domain/wp-json/wp/v2/posts';
      if (perPage != null) {
        url = _addParam(url, param: 'per_page', value: perPage.toString());
      }
      if (page != null) {
        url = _addParam(url, param: 'page', value: page.toString());
      }
      if (order != null) {
        url = _addParam(url, param: 'order', value: order);
      }
      if (orderBy != null) {
        url = _addParam(url, param: 'orderby', value: orderBy);
      }

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        for (var blog in jsonDecode(response.body)) {
          list.add(Blog.fromJson(blog));
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return list;
  }
}
