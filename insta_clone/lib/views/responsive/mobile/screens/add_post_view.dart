import 'package:flutter/material.dart';
import 'package:insta_clone/core/utils/colors.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Add Post View'),
      ),
    );
  }
}