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
}
