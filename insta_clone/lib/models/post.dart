import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String profileImg;
  final String username;
  final String description;
  final String imgPost;
  final String uid;
  final String postId;
  final DateTime datePublished;
  final List likes;

  PostModel({
    required this.profileImg,
    required this.username,
    required this.description,
    required this.imgPost,
    required this.uid,
    required this.postId,
    required this.datePublished,
    required this.likes,
  });
  Map<String, dynamic> toMap(){
    return {
      "profileImg": profileImg,
      "username": username,
      "description": description,
      "imgPost": imgPost,
      "uid": uid,
      "postId": postId,
      "datePublished": datePublished,
      "likes": likes,
    };
  }
  static convert2Model(DocumentSnapshot snapshot){
    var snap = snapshot.data() as Map<String, dynamic>;
    return PostModel(
      profileImg: snap["profileImg"],
      username: snap["username"],
      description: snap["description"],
      imgPost: snap["imgPost"],
      uid: snap["uid"],
      postId: snap["postId"],
      datePublished: snap["datePublished"],
      likes: snap["likes"],
    );
  }
}
