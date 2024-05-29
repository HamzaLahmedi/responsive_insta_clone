import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insta_clone/core/widgets/custom_comment_item.dart';
import 'package:insta_clone/core/widgets/custom_loading_widget.dart';
import 'package:insta_clone/core/widgets/custom_text_form_field.dart';
import 'package:insta_clone/firebase_services/firestore.dart';
import 'package:insta_clone/provider/user_provier.dart';
import 'package:intl/intl.dart';
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
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('posts')
              .doc(data['postId'])
              .collection('comments')
              .orderBy('date')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CustomLoadingWidget();
            }

            return Expanded(
              child: ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return CustomCommentItem(data: data);
                }).toList(),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 225, 225, 225),
                radius: 25,
                backgroundImage: NetworkImage(
                  userLoggedInfo!.imgUrl,
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
                            profileImg: userLoggedInfo.imgUrl,
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
