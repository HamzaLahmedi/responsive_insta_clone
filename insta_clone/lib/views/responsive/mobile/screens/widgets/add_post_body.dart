import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/core/utils/custom_snackbar.dart';
import 'package:insta_clone/core/utils/upload_image_for_web_and_mobile.dart';
import 'package:insta_clone/firebase_services/fireStore.dart';
import 'package:insta_clone/provider/user_provier.dart';
import 'package:provider/provider.dart';

class AddPostBody extends StatefulWidget {
  const AddPostBody({
    super.key,
    required this.onImageChanged,
    required this.isLoading,
  });
  final Function(bool) onImageChanged;

  final bool isLoading;
  @override
  State<AddPostBody> createState() => _AddPostBodyState();
}

class _AddPostBodyState extends State<AddPostBody> {
  Uint8List? imgPath;
  String? imgName;
  FirestoreMethods firestoreMethods = FirestoreMethods();
  TextEditingController descriptionController = TextEditingController();
  bool loading = false;
  final formkey = GlobalKey<FormState>();
  void setImage(Uint8List? path, String? name) {
    setState(() {
      imgPath = path;
      imgName = name;
    });
    widget.onImageChanged(imgPath != null);
  }

  showModal() {
    return showBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 100,
            color: Colors.black,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    await uploadImage2Screen(context, setImage,
                        source: ImageSource.camera);
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.camera_alt,
                      ),
                      Text(
                        'From Camera',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () async {
                    await uploadImage2Screen(context, setImage,
                        source: ImageSource.gallery);
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.photo_outlined,
                      ),
                      Text(
                        'From Gallery',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final allDataFromDB = Provider.of<UserProvider>(context).getUser;

    return imgPath != null
        ? SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loading
                      ? const Column(
                          children: [
                            LinearProgressIndicator(),
                            SizedBox(
                              height: 100,
                            ),
                          ],
                        )
                      : const SizedBox(),
                  Container(
                    width: MediaQuery.sizeOf(context).height / 3,
                    height: MediaQuery.sizeOf(context).height / 3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: MemoryImage(imgPath!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          allDataFromDB!.imgUrl,
                        ),
                        radius: 26,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 1.5,
                        child: TextFormField(
                          controller: descriptionController,
                          validator: (value) {
                            return value!.isEmpty ? "Enter a comment" : null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Write a comment...',
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          loading = true;
                        });
                        if (formkey.currentState!.validate()) {
                          firestoreMethods.uploadPost(
                            profileImg: allDataFromDB.imgUrl,
                            description: descriptionController.text,
                            username: allDataFromDB.userName,
                            title: allDataFromDB.title,
                            imgName: imgName!,
                            imgPath: imgPath!,
                            context: context,
                          );
                          setState(() {
                            loading = false;
                          });
                        }
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
            ),
          )
        : IconButton(
            onPressed: () {
              showModal();
            },
            icon: const Icon(
              Icons.upload,
              size: 55,
            ),
          );
  }
}
