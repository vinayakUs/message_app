import 'package:flutter/material.dart';
import 'package:message_app/constant.dart';
import 'package:message_app/provider_setup.dart';
import 'package:message_app/ui/view/login_view.dart';
import 'package:message_app/ui/view/signUp_view.dart';
import 'package:provider/provider.dart';
import 'services/navigator_service.dart';
import 'package:message_app/locator.dart';

void main() {
  registerLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: provider,
      child: MaterialApp(
        home: RootScreen(),
        navigatorKey: locator.get<NavigatorService>().navigatorkey,
        onGenerateRoute: (routeSettings) {
          switch (routeSettings.name) {
            case signUpViewRoute:
              return MaterialPageRoute(builder: (context) => SignUpView());
            case loginViewRoute:
              return MaterialPageRoute(builder: (context) => LoginView());
          }
        },
      ),
    );
  }
}

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("SignUp"),
                onPressed: () async {
                  locator.get<NavigatorService>().navigateTo(signUpViewRoute);
                },
              ),
              FlatButton(
                child: Text("Login"),
                onPressed: () {
                  locator.get<NavigatorService>().navigateTo(loginViewRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
