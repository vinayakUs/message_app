import 'package:flutter/material.dart';
import 'package:message_app/constant.dart';
import 'package:message_app/locator.dart';
import 'package:message_app/model/basemodel.dart';
import 'package:message_app/services/authentication_service.dart';
import 'package:message_app/services/firestore_service.dart';
import 'package:message_app/services/navigator_service.dart';

class SignUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService;
  final FirestoreService _firestoreService;
  final NavigatorService _navigatorService = locator.get<NavigatorService>();

  SignUpViewModel({
    @required AuthenticationService authenticationService,
    @required FirestoreService firestoreService,
  })  : _authenticationService = authenticationService,
        _firestoreService = firestoreService;

  Future signUp({@required String email, @required String password}) async {
    setBusy(true);
    var result = await _authenticationService.signUpWithEmail(
        email: email, password: password);
    setBusy(false);
    if (result is bool) {
      result == true
          ? _navigatorService.navigateTo(signUpViewRoute)
          : debugPrint("unknown error while registering");
    } else {
      debugPrint(result.message);
    }
  }
}
