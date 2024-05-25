import 'dart:math';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/core/utils/custom_snackbar.dart';
import 'package:insta_clone/firebase_services/storage.dart';
import 'package:insta_clone/models/user.dart';
import 'package:insta_clone/views/responsive/layout_view.dart';
import 'package:insta_clone/views/responsive/mobile/screens/login_view.dart';
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
      String imgUrl = await getImgURL(imgName: imgName, imgPath: imgPath);
      UserModel userr = UserModel(
        userName: username,
        email: emailAddress,
        password: password,
        title: title,
        imgUrl: imgUrl,
        following: [],
        followers: [],
      );

      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users
          .doc(credential.user!.uid)
          .set(userr.toMapp())
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LayoutView()),
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "Error: ${e.code}");
    } catch (e) {
      print(e);
    }
  }

  signIn({required String email, required String password, context}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LayoutView()),
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "Error: ${e.code}");
    } catch (e) {
      print(e);
    }
  }
}
