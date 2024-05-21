import 'package:flutter/material.dart';
import 'package:insta_clone/core/utils/colors.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/register_body_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        title: const Text("Register"),
        elevation: 0,
        // backgroundColor: appbarGreen,
      ),
      body: const RegisterBodyView(),
    );
  }
}

