class UserModel {
  String userName;
  String email;
  String password;
  String title;
  UserModel({
    required this.userName,
    required this.email,
    required this.password,
    required this.title,
  });

  Map<String, dynamic> toMapp() {
    return {
      'userName': userName,
      'email': email,
      'password': password,
      'title': title,
    };
  }
}