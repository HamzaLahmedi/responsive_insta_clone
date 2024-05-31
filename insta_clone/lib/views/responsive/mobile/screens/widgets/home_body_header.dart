import 'package:flutter/material.dart';
import 'package:insta_clone/firebase_services/fire_store.dart';

class HomeBodyHeader extends StatelessWidget {
  HomeBodyHeader({
    super.key,
    required this.imgUrl,
    required this.userName,
    required this.data,
  });
  final String imgUrl, userName;
// post data
  final Map data;

  final FirestoreMethods firestoreMethods = FirestoreMethods();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(imgUrl),
                radius: 26,
              ),
              const SizedBox(width: 17),
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              firestoreMethods.showmodel(
                context: context,
                uid: data['uid'],
                postId: data['postId'],
              );
            },
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
    );
  }
}
