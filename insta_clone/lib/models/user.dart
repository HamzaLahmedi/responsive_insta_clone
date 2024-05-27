import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String userName;
  String email;
  String password;
  String title;
  String imgUrl;
  List following;
  List followers;
  String uid;
  UserModel({
    required this.userName,
    required this.email,
    required this.password,
    required this.title,
    required this.imgUrl,
    required this.following,
    required this.followers,
    required this.uid,
  });

  Map<String, dynamic> toMapp() {
    return {
      'userName': userName,
      'email': email,
      'password': password,
      'title': title,
      'imgUrl': imgUrl,
      'following': following,
      'followers': followers,
      'uid': uid,
    };
  }
  // function that convert "DocumentSnapshot" to a User
// function that takes "DocumentSnapshot" and return a User

  static convertSnap2Model(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      email: snapshot["email"],
      userName: snapshot["userName"],
      password: snapshot["password"],
      title: snapshot["title"],
      imgUrl: snapshot["imgUrl"],
      following: snapshot["following"],
      followers: snapshot["followers"],
      uid: snapshot["uid"],
    );
  }
}
