import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderId;
  final String senderImg;
  final String receiverId;
  final String receiverImg;
  final DateTime dateTime;
  final String message;

  MessageModel({
    required this.senderId,
    required this.senderImg,
    required this.receiverId,
    required this.receiverImg,
    required this.dateTime,
    required this.message,
  });
  Map<String, dynamic> toMap() {
    return {
      "senderId": senderId,
      "receiverId": receiverId,
      "senderImg": senderImg,
      "receiverImg": receiverImg,
      "dateTime": dateTime,
      "message": message,
    };
  }

  static convertSnap2Model(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return MessageModel(
      senderId: snapshot["senderId"],
      receiverId: snapshot["receiverId"],
      dateTime: snapshot["dateTime"],
      message: snapshot["message"],
      senderImg: snapshot["senderImg"],
      receiverImg: snapshot["receiverImg"],
    );
  }
}
