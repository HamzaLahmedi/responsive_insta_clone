import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/core/utils/custom_snackbar.dart';
import 'package:insta_clone/views/responsive/mobile/screens/login_view.dart';

class AuthMethods {
  register(
      {required String emailAddress,
      required String password,
      required context}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "Error: ${e.code}");
    } catch (e) {
      print(e);
    }
  }
}
