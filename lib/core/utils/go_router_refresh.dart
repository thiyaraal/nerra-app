import 'dart:async';

import 'package:flutter/material.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    final broadcast = stream.isBroadcast ? stream : stream.asBroadcastStream();
    _sub = broadcast.listen((_) => notifyListeners());
  }
  late final StreamSubscription<dynamic> _sub;
  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}