import 'package:flutter/material.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/profile_stats.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.imgUrl,
  });
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 12),
          child:  CircleAvatar(
            backgroundImage: NetworkImage(
                imgUrl),
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
