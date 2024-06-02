import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.isSender,
    required this.data,
  });

  final bool isSender;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
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
                  color:
                      isSender ? Colors.white : Colors.black,
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
      ),
    );
  }
}
