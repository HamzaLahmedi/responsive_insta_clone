class UserModel {
  String userName;
  String email;
  String password;
  String title;
  String imgUrl;
  List following;
  List followers;
  UserModel({
    required this.userName,
    required this.email,
    required this.password,
    required this.title,
    required this.imgUrl,
    required this.following,
    required this.followers,
  });

  Map<String, dynamic> toMapp() {
    return {
      'userName': userName,
      'email': email,
      'password': password,
      'title': title,
      'imgUrl':imgUrl,
      'following': following,
      'followers': followers,
    };
  }
}