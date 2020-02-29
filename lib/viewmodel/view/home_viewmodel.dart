import 'package:flutter/cupertino.dart';
import 'package:message_app/model/basemodel.dart';
import 'package:message_app/services/authentication_service.dart';

class HomeViewModel extends BaseModel {
  AuthenticationService _authenticationService;
  HomeViewModel({@required AuthenticationService authenticationService})
      : _authenticationService = authenticationService;

  void getcurr() {
    print(_authenticationService.currentUser.profilePictureURL);
  }
}
