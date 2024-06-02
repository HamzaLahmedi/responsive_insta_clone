import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/core/widgets/custom_loading_widget.dart';
import 'package:insta_clone/core/widgets/custom_text_form_field.dart';
import 'package:insta_clone/provider/message_provider.dart';

class ChatMessagesViewBody extends StatefulWidget {
  const ChatMessagesViewBody({
    super.key,
    required this.receiverId,
    required this.receiverImg,
  });
  final String receiverId;
  final String receiverImg;
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
                      print('data ****************** $data');
                      bool isSender = data['senderId'] == currentUserId;

                      return Align(
                        alignment: isSender
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: isSender
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            if (!isSender)
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(data['senderImg']),
                                radius: 20,
                              ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: isSender
                                    ? Colors.deepPurple
                                    : Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.75,
                              ),
                              child: Text(
                                data['message'],
                                style: TextStyle(
                                  color: isSender ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            if (isSender)
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(data['senderImg']),
                                radius: 20,
                              ),
                          ],
                        ),
                      );
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
/*Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://i.pinimg.com/564x/94/df/a7/94dfa775f1bad7d81aa9898323f6f359.jpg',
                      ),
                      radius: 27,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.deepPurple,
                        ),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width *
                              0.75, // Max width of 75% of screen width
                        ),
                        child: const Text('Receiver Message'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.deepPurple,
                        ),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width *
                              0.75, // Max width of 75% of screen width
                        ),
                        child: const Text(
                          'Sender Message',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://i.pinimg.com/564x/94/df/a7/94dfa775f1bad7d81aa9898323f6f359.jpg',
                      ),
                      radius: 27,
                    ),
                  ],
                ),
              ],
            ),*/