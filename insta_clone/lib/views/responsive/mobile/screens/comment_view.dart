import 'package:flutter/material.dart';
import 'package:insta_clone/core/utils/colors.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/comment_view_body.dart';

class CommentView extends StatelessWidget {
  const CommentView({super.key, required this.data});
  //post data
final Map data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Comments'),
      ),
      backgroundColor: mobileBackgroundColor,
      body:  CommentViewBody(
        data: data,
      ),
    );
  }
}

