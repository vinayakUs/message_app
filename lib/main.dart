import 'package:flare_flutter/flare_cache.dart';
import 'package:flutter/material.dart';
import 'package:message_app/constant.dart';
import 'package:message_app/provider_setup.dart';
import 'package:message_app/ui/view/home_view.dart';
import 'package:message_app/ui/view/invalidpage_view.dart';
import 'package:message_app/ui/view/login_view.dart';
import 'package:message_app/ui/view/signUp_view.dart';
import 'package:message_app/ui/view/startup_view.dart';
import 'package:message_app/ui/view/userdetails_view.dart';
import 'package:message_app/ui/view/welcome_view.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
      providers: provider,
      child: MaterialApp(
        home: StartUpView(),
        navigatorKey: locator.get<NavigatorService>().navigatorkey,
        onGenerateRoute: (routeSettings) {
          switch (routeSettings.name) {
            case welcomeViewRoute:
              return MaterialPageRoute(builder: (context) => WelcomeView());
            case userDetailsRoute:
              return MaterialPageRoute(builder: (context) => UserDetailsView());
            case homeViewRoute:
              return MaterialPageRoute(builder: (context) => HomeView());
            case signUpViewRoute:
              return MaterialPageRoute(builder: (context) => SignUpView());
            case loginViewRoute:
              return MaterialPageRoute(builder: (context) => LoginView());
            default:
              return MaterialPageRoute(builder: (context) => InvalidPage());
          }
        },
      ),
    );
  }
}
