import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:narra_apps/core/helpers/paths.dart';

class MainHomeScreen extends StatelessWidget {
  final Widget child;
  const MainHomeScreen({super.key, required this.child});

  static const _tabs = <String>[Paths.home, Paths.listStories];

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _tabs.indexWhere((p) => location.startsWith(p));

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex < 0 ? 0 : currentIndex,
        onTap: (i) => context.go(_tabs[i]),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_sharp),
            label: 'Stories',
          ),
        ],
      ),
    );
  }
}
