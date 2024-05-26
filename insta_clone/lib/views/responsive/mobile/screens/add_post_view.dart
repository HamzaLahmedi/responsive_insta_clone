import 'package:flutter/material.dart';
import 'package:insta_clone/core/utils/colors.dart';
import 'package:insta_clone/firebase_services/fireStore.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/add_post_body.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  String? appBarTitle;
  bool isLoading = false;
  void updateAppBarTitle(bool hasImage) {
    setState(() {
      appBarTitle = 'Image Exists';
    });
  }
FirestoreMethods firestoreMethods = FirestoreMethods();
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
                isLoading: isLoading,
              ),
            ),
          )
        : Scaffold(
            backgroundColor: mobileBackgroundColor,
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    appBarTitle = null;
                  });
                },
                icon: const Icon(Icons.arrow_back),
              ),
              actions: [
                TextButton(
                    onPressed: ()  {
                      setState(() {
                        isLoading = true;
                      });
                       
                    },
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
                isLoading: isLoading,
              ),
            ),
          );
  }
}
