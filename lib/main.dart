import 'package:flare_flutter/flare_cache.dart';
import 'package:flutter/material.dart';
import 'package:message_app/app/router.gr.dart';
import 'services/navigator_service.dart';
import 'package:message_app/locator.dart';

void main() {
  registerLocator();
  runApp(MyApp());
  FlareCache.doesPrune = false;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: locator.get<NavigatorService>().navigatorkey,
      initialRoute: Routes.startUpViewRoute,
      onGenerateRoute: Router().onGenerateRoute,
    );
  }
}
