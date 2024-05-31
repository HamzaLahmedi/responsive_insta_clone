import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/firebase_services/fire_store.dart';
import 'package:insta_clone/views/responsive/mobile/screens/comment_view.dart';

class BottomPostIcons extends StatelessWidget {
  BottomPostIcons({
    super.key,
    required this.data,
  });
//post data
  final Map data;
  final FirestoreMethods firestoreMethods = FirestoreMethods();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  firestoreMethods.likeMethod(
                      postId: data['postId'], likes: data['likes']);
                },
                icon: data['likes']
                        .contains(FirebaseAuth.instance.currentUser!.uid)
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(Icons.favorite_border),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CommentView(
                          data: data,
                          showBottomSection: true,
                        );
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.comment_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_outline),
          ),
        ],
      ),
    );
  }
}
