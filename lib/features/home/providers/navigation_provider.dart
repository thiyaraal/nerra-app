import 'package:flutter/material.dart';

class MainNavigationProvider extends ChangeNotifier {
  final BuildContext context;
  int _currentIndex = 0;
  bool _showTitle = false;
  late final ScrollController scrollController;

  int get currentIndex => _currentIndex;
  bool get showTitle => _showTitle;

  MainNavigationProvider({required this.context}) {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);

    WidgetsBinding.instance.addPostFrameCallback((_) {
    });
  }

  void _scrollListener() {
    final isScrolled = scrollController.offset > 50;
    if (_showTitle != isScrolled) {
      _showTitle = isScrolled;
      notifyListeners();
    }
  }

  void changeIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();

  }


  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }
}
