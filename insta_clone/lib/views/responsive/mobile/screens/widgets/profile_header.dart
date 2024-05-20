import 'package:flutter/material.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/profile_stats.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 12),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/564x/94/df/a7/94dfa775f1bad7d81aa9898323f6f359.jpg'),
            radius: 40,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        const Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileStats(
                nbr: '1',
                title: 'Posts',
              ),
              SizedBox(
                width: 18,
              ),
              ProfileStats(
                nbr: '8',
                title: 'Followers',
              ),
              SizedBox(
                width: 18,
              ),
              ProfileStats(
                nbr: '15',
                title: 'Following',
              ),
            ],
          ),
        ),
      ],
    );
  }
}