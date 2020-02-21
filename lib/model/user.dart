class User {
  String userID;
  String name;
  String email;
  String profilePictureURL;
  String userName;

  User({
    this.userID,
    this.name,
    this.email,
    this.profilePictureURL,
    this.userName,
  });

  User.fromUserMap(Map<String, dynamic> map) {
    userID = map['userID'];
    name = map['name'];
    profilePictureURL = map['profilePictureURL'];
    email = map['email'];
    userName = map['userName'];
  }

  Map<String, Object> toUserMap() {
    return {
      'userID': userID,
      'firstName': name,
      'email': email,
      'profilePictureURL': profilePictureURL,
      'userName': userName,
    };
  }
}
