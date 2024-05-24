class UserModel {
  String userName;
  String email;
  String password;
  String title;
  String imgUrl;
  UserModel({
    required this.userName,
    required this.email,
    required this.password,
    required this.title,
    required this.imgUrl,
  });

  Map<String, dynamic> toMapp() {
    return {
      'userName': userName,
      'email': email,
      'password': password,
      'title': title,
      'imgUrl':imgUrl,
    };
  }
}