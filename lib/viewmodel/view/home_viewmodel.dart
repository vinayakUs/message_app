import 'package:flutter/cupertino.dart';
import 'package:message_app/locator.dart';
import 'package:message_app/model/basemodel.dart';
import 'package:message_app/services/authentication_service.dart';
import 'package:message_app/services/navigator_service.dart';

class HomeViewModel extends BaseModel {
  AuthenticationService _authenticationService;
    NavigatorService _navigatorService = locator.get<NavigatorService>();

  HomeViewModel({@required AuthenticationService authenticationService})
      : _authenticationService = authenticationService;

  void getcurr() {
    _authenticationService.signOut();
    _navigatorService.goBack();

  }
}
