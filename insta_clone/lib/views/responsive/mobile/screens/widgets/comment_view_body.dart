import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insta_clone/core/widgets/custom_text_form_field.dart';
import 'package:insta_clone/firebase_services/firestore.dart';
import 'package:insta_clone/provider/user_provier.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class CommentViewBody extends StatelessWidget {
  CommentViewBody({
    super.key,
    required this.data,
  });
  //post data
  final Map data;
  final TextEditingController commentController = TextEditingController();
  final FirestoreMethods firestoreMethods = FirestoreMethods();
  @override
  Widget build(BuildContext context) {
    final userLoggedInfo = Provider.of<UserProvider>(context).getUser;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ListTile(
          leading: const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 225, 225, 225),
            radius: 25,
            backgroundImage: NetworkImage(
              "https://cdn1-m.zahratalkhaleej.ae/store/archive/image/2020/11/4/813126b3-4c9d-4a7b-b8d9-83f46749fa26.jpg?format=jpg&preset=w1900",
            ),
          ),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'User Name',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Comment ...',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Text(
                '12/12/2024',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 225, 225, 225),
                radius: 25,
                backgroundImage: NetworkImage(
                  "https://i.pinimg.com/564x/94/df/a7/94dfa775f1bad7d81aa9898323f6f359.jpg",
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CustomTextFormField(
                    text: 'Enter Your Comment : ',
                    keyboardType: TextInputType.text,
                    controller: commentController,
                    suffixIcon: IconButton(
                      onPressed: () async {
                        if (commentController.text.isNotEmpty) {
                          firestoreMethods.uploadComment(
                            postId: data['postId'],
                            comment: commentController.text,
                            profileImg: userLoggedInfo!.imgUrl,
                            userName: userLoggedInfo.userName,
                            commentController: commentController.text,
                            uid: userLoggedInfo.uid,
                          );
                        }
                        commentController.clear();
                      },
                      icon: const Icon(
                        Icons.send,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
// item without list tile widget
/* Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 225, 225, 225),
                  radius: 25,
                  backgroundImage: NetworkImage(
                    "https://cdn1-m.zahratalkhaleej.ae/store/archive/image/2020/11/4/813126b3-4c9d-4a7b-b8d9-83f46749fa26.jpg?format=jpg&preset=w1900",
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'User Name',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Comment ...',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '12/12/2024',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
              ),
            ),
          ],
        ),*/