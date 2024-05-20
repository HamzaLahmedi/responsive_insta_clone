import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({
    super.key,
    required this.nbr,
    required this.title,
  });
  final String nbr;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(children: [
          Text(
            nbr,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ])
      ],
    );
  }
}
