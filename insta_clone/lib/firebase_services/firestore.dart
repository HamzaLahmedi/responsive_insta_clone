import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/core/utils/custom_snackbar.dart';
import 'package:insta_clone/firebase_services/storage.dart';
import 'package:insta_clone/models/post.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  uploadPost({
    required String profileImg,
    required String description,
    required String username,
    required String title,
    required String imgName,
    required Uint8List imgPath,
    required context,
  }) async {
    try {
      //Generate Unique ID
      String uid = const Uuid().v1();
      String imgUrl = await getImgURL(
          imgName: imgName,
          imgPath: imgPath,
          folderName: 'Posts/${FirebaseAuth.instance.currentUser!.uid}');
      PostModel post = PostModel(
        profileImg: profileImg,
        username: username,
        description: description,
        imgPost: imgUrl,
        uid: FirebaseAuth.instance.currentUser!.uid,
        postId: uid,
        datePublished: DateTime.now(),
        likes: [],
      );

      CollectionReference posts =
          FirebaseFirestore.instance.collection('posts');
      posts
          .doc(uid)
          .set(post.toMap())
          .then((value) => showSnackBar(context, "Post Added"))
          .catchError((error) => print("Failed to add post: $error"));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "Error: ${e.code}");
    } catch (e) {
      print(e);
    }
  }

  uploadComment({
    required String postId,
    required String profileImg,
    required String userName,
    required String commentController,
    required String uid, required String comment,
  }) async {
    String commentId = const Uuid().v1();
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .doc(commentId)
        .set({
      'profileImg': profileImg,
      'userName': userName,
      'comment': commentController,
      'date': DateTime.now(),
      'commentId': commentId,
      'userUid': uid,
    });
  }
}
