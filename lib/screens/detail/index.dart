import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:interview/model/blog.dart';

class Detail extends StatelessWidget {
  final Blog blog;
  const Detail({
    super.key,
    required this.blog,
  });

  static const routeName = 'detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blog.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: blog.image,
              child: Image.network(blog.image),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: Text('Author: ${blog.authorName}')),
                      Text(blog.date),
                    ],
                  ),
                  const SizedBox(height: 12),
                  HtmlWidget(blog.content),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
