import 'package:flutter/material.dart';

class ProfileUnfollowButton extends StatelessWidget {
  const ProfileUnfollowButton({super.key, this.onPressed});
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(143, 255, 55, 112)),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 9, horizontal: 66)),
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
