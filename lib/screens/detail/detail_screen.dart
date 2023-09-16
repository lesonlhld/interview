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
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: blog.image,
                  child: Image.network(
                    blog.image,
                    fit: BoxFit.cover,
                    width: size.width,
                    height: size.height * 0.3,
                  ),
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
          Container(
            height: kToolbarHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey[800]!,
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 8.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
