import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:message_app/locator.dart';
import 'package:message_app/model/basemodel.dart';
import 'package:message_app/model/user.dart';
import 'package:message_app/services/authentication_service.dart';
import 'package:message_app/services/firestore_service.dart';
import 'package:message_app/services/navigator_service.dart';

class UserDetailsViewModel extends BaseModel {
  FirestoreService _fireStoreService;
  AuthenticationService _authenticationService;

  UserDetailsViewModel({
    @required FirestoreService fireStoreService,
    @required AuthenticationService authenticationService,
  })  : _fireStoreService = fireStoreService,
        _authenticationService = authenticationService;

  NavigatorService _navigatorService = locator.get<NavigatorService>();

  void finish({@required String name, @required String userName}) async {
    var res = await _fireStoreService.isUserNameRegistered(userName);
    FirebaseUser firebaseUser = _authenticationService.firebaseUser;

    if (!res) {
      await _fireStoreService.createUser(User(
        name: name,
        userName: userName,
        userID: firebaseUser.uid,
        email: firebaseUser.email,
        profilePictureURL: "",
      ));
      _navigatorService.goBack();
    }
  }
}
