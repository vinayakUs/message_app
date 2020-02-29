import 'package:flutter/material.dart';
import 'package:message_app/locator.dart';
import 'package:message_app/model/basemodel.dart';
import 'package:message_app/services/authentication_service.dart';
import 'package:message_app/services/navigator_service.dart';

class SignUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService;
  final NavigatorService _navigatorService = locator.get<NavigatorService>();

  SignUpViewModel({
    @required AuthenticationService authenticationService,
  }) : _authenticationService = authenticationService;

  Future signUp({
    @required String email,
    @required String password,
  }) async {
    _navigatorService.goBack();
     setBusy(true);
     var result = await _authenticationService.signUpWithEmail(
       email: email,
       password: password,
     );
     setBusy(false);
     if (result is bool) {
       result == true
           ? naigateto()
           : debugPrint("unknown error while registering");
     } else {
       debugPrint(result.message);
     }
  }

  void naigateto() {
    _navigatorService.goBack();
  }
}
