import 'package:flutter/material.dart';
import 'package:insta_clone/core/utils/colors.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/add_post_body.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  String? appBarTitle;

  void updateAppBarTitle(bool hasImage) {
    setState(() {
      appBarTitle = 'Image Exists';
    });
  }

  @override
  Widget build(BuildContext context) {
    return appBarTitle == null
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              title: const Text('Add Post'),
            ),
            backgroundColor: mobileBackgroundColor,
            body: Center(
              child: AddPostBody(
                onImageChanged: updateAppBarTitle,
              ),
            ),
          )
        : Scaffold(
            backgroundColor: mobileBackgroundColor,
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back),
              ),
              actions: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Post',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
            body: Center(
              child: AddPostBody(
                onImageChanged: updateAppBarTitle,
              ),
            ),
          );
  }
}
