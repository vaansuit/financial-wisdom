class UserModel {
  String userID;
  String userName;
  String email;
  String profilePictureURL;

  UserModel({
    this.userID = '',
    this.userName = '',
    this.email = '',
    this.profilePictureURL = '',
  });

  factory UserModel.fromJson(Map<String, dynamic> parsedJson) {
    return UserModel(
      userID: parsedJson['id'] ?? parsedJson['userID'] ?? '',
      userName: parsedJson['userName'] ?? '',
      email: parsedJson['email'] ?? '',
      profilePictureURL: parsedJson['profilePictureURL'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': userID,
      'userName': userName,
      'email': email,
      'profilePictureURL': profilePictureURL,
    };
  }
}
