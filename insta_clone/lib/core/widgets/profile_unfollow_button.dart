import 'package:flutter/material.dart';

class ProfileUnfollowButton extends StatelessWidget {
  const ProfileUnfollowButton({super.key, this.onPressed});
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(143, 255, 55, 112)),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 9, horizontal: screenWidth * .08)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
      child: const Text(
        "unfollow",
        style: TextStyle(fontSize: 17),
      ),
    );
  }
}
