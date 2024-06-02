import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/core/widgets/custom_loading_widget.dart';
import 'package:insta_clone/core/widgets/custom_message_item.dart';
import 'package:insta_clone/core/widgets/custom_text_form_field.dart';
import 'package:insta_clone/provider/message_provider.dart';

class ChatMessagesViewBody extends StatefulWidget {
  const ChatMessagesViewBody({
    super.key,
    required this.receiverId,
    required this.receiverImg, required this.receiverName,
  });
  final String receiverId;
  final String receiverImg;
  final String receiverName;
  @override
  State<ChatMessagesViewBody> createState() => _ChatMessagesViewBodyState();
}

class _ChatMessagesViewBodyState extends State<ChatMessagesViewBody> {
  final TextEditingController messageController = TextEditingController();
  ChatServices chatServices = ChatServices();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void sendMessage() async {
    if (messageController.text.isNotEmpty) {
      await chatServices.sendMessage(
        message: messageController.text,
        receiverId: widget.receiverId,
        receiverImg: widget.receiverImg,
        senderName: widget.receiverName,
      );
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = _auth.currentUser!.uid;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: chatServices.getMessages(
                senderId: currentUserId,
               receiverId: widget.receiverId,
              ),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CustomLoadingWidget();
                }

                return Expanded(
                  child: ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      bool isSender = data['senderId'] == currentUserId;

                      return MessageItem(isSender: isSender, data: data);
                    }).toList(),
                  ),
                );
              },
            ),
            CustomTextFormField(
              text: 'Type a message',
              controller: messageController,
              isObsecure: false,
              suffixIcon: IconButton(
                onPressed: () {
                  sendMessage();
                },
                icon: const Icon(
                  Icons.send,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

