import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBodyHeader extends StatelessWidget {
  const HomeBodyHeader({
    super.key, required this.imgUrl, required this.userName,
  });
final String imgUrl , userName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    imgUrl),
                radius: 26,
              ),
             const SizedBox(width: 17),
              Text(
                userName,
                style:const TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
    );
  }
}
