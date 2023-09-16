import 'package:flutter/material.dart';
import 'package:interview/providers/blog/blog_model.dart';
import 'package:interview/screens/home/index.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    context.read<BlogModel>().getBlogs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}
