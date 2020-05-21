import 'package:flutter/cupertino.dart';
import 'package:message_app/locator.dart';
import 'package:message_app/model/basemodel.dart';
import 'package:message_app/services/authentication_service.dart';
import 'package:message_app/services/navigator_service.dart';

class LoginViewModel extends BaseModel {
  AuthenticationService _authenticationService=locator.get<AuthenticationService>();
  NavigatorService _navigatorService = locator.get<NavigatorService>();

  Future login({@required String email, @required String password}) async {
    setBusy(true);
    var result = await _authenticationService.loginWithEmail(
        email: email, password: password);
    setBusy(false);
    if (result is bool) {
      result == true
          ? _navigatorService.goBack()
          : debugPrint("error while login ");
    } else {
      debugPrint(result.message);
    }
  }
}
