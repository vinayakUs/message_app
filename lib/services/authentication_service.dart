import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:message_app/model/user.dart';
import 'package:message_app/services/firestore_service.dart';

class AuthenticationService {
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;
  final FirestoreService _fireStoreService;

  User _currentUser;
  User get currentUser => _currentUser;
  FirebaseUser _firebaseUser;
  FirebaseUser get firebaseUser => _firebaseUser;

  setFirebaseUser(FirebaseUser user) {
    _firebaseUser = user;
  }

  AuthenticationService({@required FirestoreService fireStoreService})
      : _fireStoreService = fireStoreService;

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var user = await _fireBaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return user != null;
    } catch (e) {
      return e;
    }
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var user = await _fireBaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return user != null;
    } catch (e) {
      return e;
    }
  }

  Stream get onAuthChange => _fireBaseAuth.onAuthStateChanged;

  Future populateCurrentUser() async {
    if (firebaseUser != null) {
      _currentUser = await _fireStoreService.getUser(firebaseUser.uid);
    }
  }
}
