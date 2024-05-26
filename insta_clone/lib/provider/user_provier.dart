import 'package:flutter/material.dart';
import 'package:insta_clone/firebase_services/auth.dart';
import 'package:insta_clone/models/user.dart';

class UserProvider with ChangeNotifier {
  UserModel? _userModel;
  UserModel? get getUser => _userModel;

  refreshUser() async {
    UserModel userModel = await AuthMethods().getUserDetails();
    _userModel = userModel;
    notifyListeners();
  }
}
