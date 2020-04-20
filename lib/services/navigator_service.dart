import 'package:flutter/widgets.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> _navigatorkey =
      new GlobalKey<NavigatorState>();

  get navigatorkey => _navigatorkey;


  Future<dynamic> navigateTo(String routeName, {Object arguments}) {
    return _navigatorkey.currentState
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> replaceTo(String routeName, {Object arguments}) {
    return _navigatorkey.currentState.pushReplacementNamed(routeName);
  }

  goBack() {
    return _navigatorkey.currentState.pop();
  }

}
