import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:message_app/locator.dart';
import 'package:message_app/model/user.dart';
import 'package:message_app/services/firestore_service.dart';

class AuthenticationService {
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;
  FirestoreService _fireStoreService=locator.get<FirestoreService>();

  User _currentUser;
  User get currentUser => _currentUser;
  FirebaseUser _firebaseUser;

  FirebaseUser get firebaseUser => _firebaseUser;
  Stream get onAuthChange => _fireBaseAuth.onAuthStateChanged;

  setFirebaseUser(FirebaseUser user) {
    print("set firebase user called ${user.email}");
    _firebaseUser = user;
  }

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

  Future populateCurrentUser() async {
    if (firebaseUser != null) {
      _currentUser = await _fireStoreService.getUser(firebaseUser.uid);
    } else {
      var a = await _fireBaseAuth.currentUser();
      var user = await _fireStoreService.getUser(a.uid);
      _currentUser = User.fromUserMap(user);
    }
  }
  void signOut(){
    _fireBaseAuth.signOut();
  }
}
