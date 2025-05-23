class UserDataModel {
  final String userName, userID, userEmail;
  final String? userImage, imageFile, userRole;

  UserDataModel(
      {required this.userName,
      required this.userID,
      required this.userEmail,
      this.userImage,
      this.imageFile,
      this.userRole});

  factory UserDataModel.fromJson(json) {
    return UserDataModel(
        userName: json['userName'],
        userID: json['userID'],
        userEmail: json['userEmail'],
        userImage: json['userImage'],
        imageFile: json['imageFile'],
        userRole: json['userRole']);
  }

  toJson() {
    return {
      'userName': userName,
      'userID': userID,
      'userEmail': userEmail,
      'userImage': userImage,
      'imageFile': imageFile,
      'userRole': userRole
    };
  }

  UserDataModel copyWith(
      {String? userName,
      String? userID,
      String? userEmail,
      String? userImage,
      String? imageFile,
      String? userRole}) {
    return UserDataModel(
      userName: userName ?? this.userName,
      userID: userID ?? this.userID,
      userEmail: userEmail ?? this.userEmail,
      userImage: userImage ?? this.userImage,
      imageFile: imageFile ?? this.imageFile,
      userRole: userRole ?? this.userRole,
    );
  }
}
