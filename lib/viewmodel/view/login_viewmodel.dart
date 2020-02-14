import 'package:flutter/cupertino.dart';
import 'package:message_app/constant.dart';
import 'package:message_app/locator.dart';
import 'package:message_app/model/basemodel.dart';
import 'package:message_app/services/authentication_service.dart';
import 'package:message_app/services/navigator_service.dart';
import 'package:message_app/ui/view/login_view.dart';

class LoginViewModel extends BaseModel {
  AuthenticationService _authenticationService;
  NavigatorService _navigatorService = locator.get<NavigatorService>();
  LoginViewModel({@required AuthenticationService authenticationService})
      : _authenticationService = authenticationService;

  Future login({@required String email, @required String password}) async {
    setBusy(true);
    var result = await _authenticationService.loginWithEmail(
        email: email, password: password);
    setBusy(false);
    if (result is bool) {
      result == true
          ? _navigatorService.navigateTo(homeViewRoute)
          : debugPrint("error while login ");
    } else {
      debugPrint(result.message);
    }
  }
}
