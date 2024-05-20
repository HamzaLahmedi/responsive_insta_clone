import 'package:flutter/material.dart';
import 'package:insta_clone/core/utils/colors.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: Center(
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.upload,
            size: 55,
          ),
        ),
      ),
    );
  }
}
