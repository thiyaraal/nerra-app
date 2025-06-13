import 'package:flutter/material.dart';
import 'package:narra_apps/features/add_stories/views/add_stories.dart';
import 'package:narra_apps/features/stories/screens/detail_stories.dart';
import 'package:narra_apps/features/auth/login/screens/login_screen.dart';
import 'package:narra_apps/features/home/screens/home_screen.dart';

import 'package:narra_apps/features/stories/screens/list_stories.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String listStories = '/list-stories';
  static const String main = '/main';
  static const String addStories = '/add-stories';
  static const String detailStories = '/detail-stories';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case addStories:
        return MaterialPageRoute(builder: (_) => const AddStoriesScreen());
      case detailStories:
        return MaterialPageRoute(builder: (_) => const DetailStoriesScreen());

      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case listStories:
        return MaterialPageRoute(builder: (_) => const ListStoriesScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                appBar: AppBar(title: const Text('404')),
                body: const Center(child: Text('Page not found')),
              ),
        );
    }
  }
}
