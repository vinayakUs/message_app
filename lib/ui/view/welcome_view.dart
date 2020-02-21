import 'package:flutter/material.dart';
import 'package:message_app/services/navigator_service.dart';
import '../../constant.dart';
import '../../locator.dart';

//This View Contains Navigation to SignUp and Login Page

class WelcomeView extends StatefulWidget {
  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  void initState() {
print("init");
    super.initState();

  }
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
