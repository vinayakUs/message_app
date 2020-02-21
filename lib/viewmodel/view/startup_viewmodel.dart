import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:message_app/model/basemodel.dart';
import 'package:message_app/services/authentication_service.dart';
import 'package:message_app/services/firestore_service.dart';

enum Status {
  hasUserData,
  notUserData,
  noUser,
}

class StartUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService;
  final FirestoreService _fireStoreService;
  StartUpViewModel({
    @required AuthenticationService authenticationService,
    @required FirestoreService fireStoreService,
  })  : _authenticationService = authenticationService,
        _fireStoreService = fireStoreService;

  Stream startUpLogic() async* {
    Stream<FirebaseUser> user = _authenticationService.onAuthChange;
    await for (var firebaseUser in user) {
      if (firebaseUser != null) {

        _authenticationService.setFirebaseUser(firebaseUser);
        var hasData = await _fireStoreService.userHasData(firebaseUser.uid);
        if (hasData is bool) {

          if (hasData) {
            _authenticationService.populateCurrentUser();
            yield Status.hasUserData;
          } else {
            yield Status.notUserData;
          }
        }
      } else if (firebaseUser == null) {
        yield Status.noUser;
      }
    }
  }
}
