import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:insta_clone/models/message.dart';

class ChatServices extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // send message
  Future<void> sendMessage({
    required String message,
    required String receiverId,
    required String receiverImg,
  }) async {
    final currentUserId = _auth.currentUser!.uid;
    final senderData =
        await _firestore.collection('users').doc(currentUserId).get();
    final senderImg = senderData['imgUrl'];
    final DateTime timeSend = DateTime.now();
    MessageModel newMessage = MessageModel(
      senderId: currentUserId,
      senderImg: senderImg,
      receiverId: receiverId,
      receiverImg: receiverImg,
      dateTime: timeSend,
      message: message,
    );
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join('-');

    await _firestore
        .collection('chats')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());

    notifyListeners();
  }

  // get message
  Stream<QuerySnapshot> getMessages(
      {required String senderId, required String receiverId}) {
    List<String> ids = [senderId, receiverId];
    ids.sort();
    String chatRoomId = ids.join('-');
    return _firestore
        .collection('chats')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('dateTime', descending: false)
        .snapshots();
  }
}
