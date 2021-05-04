import 'package:flutter/widgets.dart';

class SimpleNavigatorObserver extends NavigatorObserver {
  List<Route> pushed = [];

  @override
  void didPush(Route route, Route? previousRoute) => pushed.add(route);
}
