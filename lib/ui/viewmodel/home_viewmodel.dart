import 'package:message_app/locator.dart';
import 'package:message_app/model/basemodel.dart';
import 'package:message_app/services/authentication_service.dart';

class HomeViewModel extends BaseModel {
  AuthenticationService _authenticationService=locator.get<AuthenticationService>();

  void getcurr() {
    _authenticationService.signOut();
  }
}
