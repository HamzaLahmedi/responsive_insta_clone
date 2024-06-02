import 'package:flutter/material.dart';
import 'package:insta_clone/core/utils/colors.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/chat_messages_view_body.dart';

class ChatMessagesView extends StatelessWidget {
  const ChatMessagesView({super.key, required this.data});
  //message data from ReceivingMessagesListViewBody widget
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: ChatMessagesViewBody(
        receiverId: data['uid'],
        receiverImg: data['imgUrl'],
      ),
    );
  }
}
