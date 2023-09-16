import 'package:flutter/material.dart';
import 'package:interview/providers/blog/blog_model.dart';
import 'package:provider/provider.dart';

import 'widgets/blog_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const routeName = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scrollController = ScrollController();

  Future<void> _onRefresh() async {
    return context.read<BlogModel>().refreshBlog();
  }

  void onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<BlogModel>().getMoreBlogs();
    }
  }

  @override
  void initState() {
    _scrollController.addListener(onScroll);
    super.initState();
  }

  @override
  dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BlogModel>(
      builder: (context, blogModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          body: blogModel.isLoading
              ? const Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: _onRefresh,
                  child: ListView.separated(
                    controller: _scrollController,
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemBuilder: (context, index) {
                      if (index == blogModel.blogs.length) {
                        if (blogModel.isLoadMore) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (!blogModel.hasMore) {
                          return const Center(child: Text('No more blogs'));
                        }
                        return const SizedBox();
                      }

                      final blog = blogModel.blogs[index];
                      return BlogCard(blog: blog);
                    },
                    itemCount: blogModel.blogs.length + 1,
                  ),
                ),
        );
      },
    );
  }
}
