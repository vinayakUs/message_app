import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:message_app/model/basemodel.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future loginWithEmail(
      {@required String email, @required String password}) async {
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return user != null;
    } catch (e) {
      return e;
    }
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
    @required String profilepic,
    @required String name,
  }) async {
    try {
      var user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return user != null;
    } catch (e) {
      return e;
    }
  }
}
