/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/core/widgets/custom_loading_widget.dart';
import 'package:insta_clone/views/responsive/mobile/screens/chat_messages_view.dart';

class ListOfUsersFollowEachOtherBody extends StatelessWidget {
  ListOfUsersFollowEachOtherBody({
    super.key,
    
  });
  
  final String currentUserId = FirebaseAuth.instance.currentUser!.uid;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final userData = _firestore.collection('users').doc(currentUserId).get()as Map<String, dynamic>;
    
    
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomLoadingWidget();
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Text('No messages found');
        }

        return ListView(
          children:
              snapshot.data!.docs.map<Widget>((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            print(
                '************************************************************');
            print(data);
            return
                 ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://i.pinimg.com/564x/94/df/a7/94dfa775f1bad7d81aa9898323f6f359.jpg',
                      ),
                      radius: 27,
                    ),
                    title: const Text(
                      'User Name',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    subtitle: const Text(
                      'Your Email',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ChatMessagesView(
                                data: data,
                              );
                            },
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                  );
                
          }).toList(),
        );
      },
    );
  }
}
*/