import 'package:flutter/material.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/profile_stats.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.imgUrl,
    required this.nbrFollower,
    required this.nbrFollowing, required this.nbrPosts,
  });
  final String imgUrl, nbrFollower, nbrFollowing , nbrPosts;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 12),
          child: CircleAvatar(
            backgroundImage: NetworkImage(imgUrl),
            radius: 40,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               ProfileStats(
                nbr: nbrPosts,
                title: 'Posts',
              ),
              const SizedBox(
                width: 18,
              ),
              ProfileStats(
                nbr: nbrFollower,
                title: 'Followers',
              ),
              const SizedBox(
                width: 18,
              ),
              ProfileStats(
                nbr: nbrFollowing,
                title: 'Following',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
