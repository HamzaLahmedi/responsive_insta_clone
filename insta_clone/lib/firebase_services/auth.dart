import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/core/utils/custom_snackbar.dart';
import 'package:insta_clone/firebase_services/storage.dart';
import 'package:insta_clone/models/user.dart';
import 'package:insta_clone/views/responsive/layout_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthMethods {
  register({
    required String emailAddress,
    required String password,
    required String username,
    required String title,
    required String imgName,
    required Uint8List imgPath,
    required context,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      String imgUrl = await getImgURL(
          imgName: imgName, imgPath: imgPath, folderName: 'UsersProfileImg');
      UserModel userr = UserModel(
        userName: username,
        email: emailAddress,
        password: password,
        title: title,
        imgUrl: imgUrl,
        following: [],
        followers: [],
        uid: credential.user!.uid,
      );

      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users
          .doc(credential.user!.uid)
          .set(userr.toMapp())
          .then(
            (value) => showSnackBar(context, "User Added"),
          )
          .catchError(
            (error) => showSnackBar(context, 'Failed to add user: $error'),
          );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LayoutView()),
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "Error: ${e.code}");
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }

  signIn({required String email, required String password, context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LayoutView()),
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "Error: ${e.code}");
    } catch (e) {
      //showSnackBar(context, "Error: ${e.toString()}");
      print(e);
    }
  }

// functoin to get user details from Firestore (Database)
  Future<UserModel> getUserDetails() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return UserModel.convertSnap2Model(snap);
  }
}
