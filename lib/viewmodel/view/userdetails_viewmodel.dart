import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:message_app/constant.dart';
import 'package:message_app/locator.dart';
import 'package:message_app/model/basemodel.dart';
import 'package:message_app/model/user.dart';
import 'package:message_app/services/authentication_service.dart';
import 'package:message_app/services/firestore_service.dart';
import 'package:message_app/services/navigator_service.dart';

class UserDetailsViewModel extends BaseModel {

  FirestoreService _fireStoreService=locator.get<FirestoreService>();
  final AuthenticationService _authenticationService=locator.get<AuthenticationService>();
  NavigatorService _navigatorService = locator.get<NavigatorService>();


  void finish({
    @required String name,
    @required String userName,
  }) async {
    setBusy(true);
    print(userName);
    var res = await _fireStoreService.isUserNameRegistered(userName);
    print(res);
    if (!res) {
      FirebaseUser firebaseUser = _authenticationService.firebaseUser;
      await _fireStoreService.createUser(User(
        name: name,
        username: userName,
        userID: firebaseUser.uid,
        email: firebaseUser.email,
        profilePictureURL: "",
      ));
      setBusy(false);
      _navigatorService.navigateTo(homeViewRoute);
    }
  }
}
