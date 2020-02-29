class User {
  String userID;
  String name;
  String email;
  String profilePictureURL;
  String username;

  User({
    this.userID,
    this.name,
    this.email,
    this.profilePictureURL,
    this.username,
  });

  User.fromUserMap(Map<String, dynamic> map) {
    userID = map['userID'];
    name = map['name'];
    profilePictureURL = map['profilePictureURL'];
    email = map['email'];
    username = map['username'];
  }

  Map<String, Object> toUserMap() {
    return {
      'userID': userID,
      'firstName': name,
      'email': email,
      'profilePictureURL': profilePictureURL,
      'username': username,
    };
  }
}
