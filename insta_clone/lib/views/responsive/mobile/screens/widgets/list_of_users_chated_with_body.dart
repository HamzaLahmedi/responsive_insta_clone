import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/core/widgets/custom_loading_widget.dart';
import 'package:insta_clone/views/responsive/mobile/screens/chat_messages_view.dart';

class ListOfUsersChatedWithBody extends StatelessWidget {
  ListOfUsersChatedWithBody({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('users')
          .where('following', arrayContains: _auth.currentUser!.uid)
          .get(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatMessagesView(
                          data: snapshot.data.docs[index].data(),
                        ),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(snapshot.data.docs[index]['imgUrl']),
                    radius: 26,
                  ),
                  title: Text(snapshot.data.docs[index]['userName']),
                );
              });
        }

        return const CustomLoadingWidget();
      },
    );
  }
}
