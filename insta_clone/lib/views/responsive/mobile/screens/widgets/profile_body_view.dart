import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insta_clone/core/utils/custom_snackbar.dart';
import 'package:insta_clone/core/widgets/profile_follow_button.dart';
import 'package:insta_clone/core/widgets/profile_message_button.dart';
import 'package:insta_clone/core/widgets/profile_posts.dart';
import 'package:insta_clone/core/widgets/profile_unfollow_button.dart';
import 'package:insta_clone/views/responsive/mobile/screens/chat_messages_view.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/profile_header.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/profile_icons_section.dart';

class ProfileBodyView extends StatefulWidget {
  const ProfileBodyView({
    super.key,
    required this.onUserNameChanged,
    required this.uid,
  });
  final Function(String) onUserNameChanged;
  final String uid;

  @override
  State<ProfileBodyView> createState() => _ProfileBodyViewState();
}

class _ProfileBodyViewState extends State<ProfileBodyView> {
  bool isLoading = true;
  bool showFollowButton = true;
  late int followers;
  late int following;
  Map<String, dynamic> userData = {};
  late int nbrPosts;
  getData() async {
    try {
      setState(() {
        isLoading = true;
      });
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(widget.uid)
          .get();
      userData = snapshot.data()!;
      widget.onUserNameChanged(userData['userName']);
      followers = userData['followers'].length;
      following = userData['following'].length;
      var snapshotPosts = await FirebaseFirestore.instance
          .collection('posts')
          .where("uid", isEqualTo: widget.uid)
          .get();
      nbrPosts = snapshotPosts.docs.length;
      showFollowButton = userData['followers']
          .contains(FirebaseAuth.instance.currentUser!.uid);
    } catch (e) {
      if (!mounted) return;
      showSnackBar(
        context,
        e.toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        : Padding(
            padding: screenWidth > 600
                ? const EdgeInsets.all(40)
                : const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ProfileHeader(
                  imgUrl: userData['imgUrl'],
                  nbrFollower: followers.toString(),
                  nbrFollowing: following.toString(),
                  nbrPosts: nbrPosts.toString(),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(35, 21, 0, 0),
                  width: double.infinity,
                  child: Text(userData['title']),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 0.44,
                ),
                const SizedBox(
                  height: 9,
                ),
                widget.uid == FirebaseAuth.instance.currentUser!.uid
                    ? const IconsSection()
                    : showFollowButton == false
                        ? ProfileFollowButton(
                            onPressed: () async {
                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(widget.uid)
                                  .update({
                                "followers": FieldValue.arrayUnion(
                                    [FirebaseAuth.instance.currentUser!.uid])
                              });
                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .update({
                                "following": FieldValue.arrayUnion([widget.uid])
                              });
                              followers++;
                              setState(() {
                                showFollowButton = true;
                              });
                            },
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ProfileUnfollowButton(
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(widget.uid)
                                      .update({
                                    "followers": FieldValue.arrayRemove([
                                      FirebaseAuth.instance.currentUser!.uid
                                    ])
                                  });
                                  await FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .update({
                                    "following":
                                        FieldValue.arrayRemove([widget.uid])
                                  });
                                  followers--;
                                  setState(() {
                                    showFollowButton = false;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              ProfileMessageButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return ChatMessagesView(data: userData);
                                    },
                                  ));
                                },
                              ),
                            ],
                          ),
                const SizedBox(
                  height: 9,
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 0.44,
                ),
                const SizedBox(
                  height: 20,
                ),
                ProfilePosts(
                  uid: widget.uid,
                ),
              ],
            ),
          );
  }
}
