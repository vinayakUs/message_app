import 'package:flutter_test/flutter_test.dart';
import 'package:message_app/services/authentication_service.dart';
import 'package:message_app/services/validator.dart';

void main() {
  test("description", () async {
    var a = await AuthenticationService()
        .loginWithEmail(email: "abc@gmail.com", password: "Vinayak12@");
    print(a);
  });
  test("email check", () {
    var a = Validator().validateEmail("vinayak@s.cocm");
    expect(true, a);
  });
}
