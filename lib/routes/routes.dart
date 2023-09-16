import 'package:flutter/material.dart';

import '../model/blog.dart';
import '../screens/detail/detail_screen.dart';
import '../screens/home/home_screen.dart';

class Routes {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Home.routeName:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
      case Detail.routeName:
        final argument = settings.arguments;
        if (argument is Blog) {
          return MaterialPageRoute(
            builder: (context) => Detail(
              blog: argument,
            ),
          );
        }

        return unDefinedRoute();
      default:
        return unDefinedRoute();
    }
  }

  static Route unDefinedRoute([String message = 'Page not founds']) {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: Center(
            child: Text(message),
          ),
        );
      },
    );
  }
}
