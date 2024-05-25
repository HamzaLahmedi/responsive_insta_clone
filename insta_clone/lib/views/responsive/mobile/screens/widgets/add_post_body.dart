import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/core/utils/upload_image_for_web_and_mobile.dart';

class AddPostBody extends StatefulWidget {
  const AddPostBody({
    super.key, required this.onImageChanged,
  });
final Function(bool) onImageChanged;
  @override
  State<AddPostBody> createState() => _AddPostBodyState();
}

class _AddPostBodyState extends State<AddPostBody> {
  Uint8List? imgPath;
  String? imgName;
  //final UploadImg uploadImg = UploadImg();

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
    return imgPath != null
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/564x/94/df/a7/94dfa775f1bad7d81aa9898323f6f359.jpg'),
                    radius: 26,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 1.5,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Write a comment...',
                      ),
                    ),
                  ),
                ],
              ),
            ],
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
