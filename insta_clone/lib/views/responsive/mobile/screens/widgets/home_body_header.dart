import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBodyHeader extends StatelessWidget {
  const HomeBodyHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/564x/94/df/a7/94dfa775f1bad7d81aa9898323f6f359.jpg'),
                radius: 26,
              ),
              SizedBox(width: 17),
              Text(
                'User Name',
                style: TextStyle(
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
