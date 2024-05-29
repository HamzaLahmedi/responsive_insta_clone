import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCommentItem extends StatelessWidget {
  const CustomCommentItem({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 225, 225, 225),
        radius: 25,
        backgroundImage: NetworkImage(
          data['profileImg'],
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                data['userName'],
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                data['comment'],
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Text(
            DateFormat.yMMMd().format(data['date'].toDate()),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.favorite,
        ),
      ),
    );
  }
}
