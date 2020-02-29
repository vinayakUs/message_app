import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:message_app/model/user.dart';

class FirestoreService {
  final CollectionReference _documentReference =
      Firestore.instance.collection('users');

  Future createUser(User user) async {
    try {
      await _documentReference.document(user.userID).setData(user.toUserMap());
    } catch (e) {
      return e;
    }
  }

  String _temp;
  String get temp => _temp;
  set temp(val) {
    _temp = val;
  }

  Future isUserNameRegistered(String username) async {
    QuerySnapshot snap = await _documentReference
        .where('username', isEqualTo: username)
        .getDocuments();
    print("documet ${snap.documents.length}");
    return snap.documents.length != 0;
  }

  userHasData(String uID) async {
    try {
      var rr = await _documentReference.document(uID).get();
      // return rr.exists;
      return rr.exists;
    } catch (e) {
      return e;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _documentReference.document(uid).get();
      return User.fromUserMap(userData.data);
    } catch (e) {
      return e;
    }
  }
}
