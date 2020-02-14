import 'package:flutter/widgets.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> _navigatorkey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {Object arguments}) {
    return _navigatorkey.currentState
        .pushNamed(routeName, arguments: arguments);
  }

  bool goBack({var returntouser}) {
    return _navigatorkey.currentState.pop(returntouser);
  }

  get navigatorkey => _navigatorkey;
}
