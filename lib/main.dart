import 'package:flutter/material.dart';
import 'package:interview/providers/blog/blog_model.dart';
import 'package:interview/routes/routes.dart';
import 'package:interview/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BlogModel>(create: (_) => BlogModel()),
      ],
      child: const MaterialApp(
        title: 'Interview',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.getRoute,
        home: Home(),
      ),
    );
  }
}
