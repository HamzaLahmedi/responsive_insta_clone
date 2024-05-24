import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/custom_profile_icon.dart';

class IconsSection extends StatelessWidget {
  const IconsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomProfileIcon(
          icon: Icons.edit,
          buttonTitle: 'Edit Profile',
          backgroundColor:
              MaterialStateProperty.all(const Color.fromARGB(0, 90, 103, 223)),
          borderColor: Colors.white,
          onPressed: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        CustomProfileIcon(
          icon: Icons.logout,
          buttonTitle: 'Logout',
          backgroundColor: MaterialStateProperty.all(
            const Color.fromARGB(143, 255, 55, 112),
          ),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
          },
        ),
      ],
    );
  }
}
