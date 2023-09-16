import 'package:flutter/material.dart';

import '../../../model/blog.dart';
import '../../detail/detail_screen.dart';

class BlogCard extends StatelessWidget {
  final Blog blog;
  const BlogCard({
    super.key,
    required this.blog,
  });

  @override
  Widget build(BuildContext context) {
    void onTap() {
      Navigator.of(context).pushNamed(Detail.routeName, arguments: blog);
    }

    final size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 10),
            Text(
              blog.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(blog.date),
          ],
        ),
      ),
    );
  }
}
