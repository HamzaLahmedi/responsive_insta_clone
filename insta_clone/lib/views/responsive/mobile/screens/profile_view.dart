import 'package:flutter/material.dart';
import 'package:insta_clone/core/utils/colors.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/profile_body_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.uid,});
final String uid;
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String userName = 'User Name';

  void updateUserName(String name) {
    setState(() {
      userName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text(userName),
      ),
      body: ProfileBodyView(
        onUserNameChanged: updateUserName,
        uid: widget.uid,
      ),
    );
  }
}
