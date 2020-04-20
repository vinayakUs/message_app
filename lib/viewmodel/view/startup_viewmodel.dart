import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:message_app/locator.dart';
import 'package:message_app/model/basemodel.dart';
import 'package:message_app/services/authentication_service.dart';
import 'package:message_app/services/firestore_service.dart';

enum Status {
  hasUserData,
  notUserData,
  noUser,
}

class StartUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService=locator.get<AuthenticationService>();
  final FirestoreService _fireStoreService=locator.get<FirestoreService>();


  Stream startUpLogic() async* {
    Stream<FirebaseUser> user = _authenticationService.onAuthChange;
    await for (var firebaseUser in user) {
      if (firebaseUser != null) {
        print("stream data fired");
        var hasData = await _fireStoreService.userHasData(firebaseUser.uid);

        if (hasData is bool) {
          if (hasData) {
            _authenticationService.setFirebaseUser(firebaseUser);
            _authenticationService.populateCurrentUser();
            yield Status.hasUserData;
          } else {
            _authenticationService.setFirebaseUser(firebaseUser);
            yield Status.notUserData;
          }
        }
      } else if (firebaseUser == null) {
        yield Status.noUser;
      }
    }
  }
}
