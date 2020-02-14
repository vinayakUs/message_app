class Validator {
  bool validateEmail(String email) {
    Pattern pattern = r'^([a-zA-Z\d\.-]+)@([a-zA-Z]+).([a-zA-Z]+)$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(email);
  }

  bool validatePassword(String password) {
    Pattern pattern =
        r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(password);
  }
}
