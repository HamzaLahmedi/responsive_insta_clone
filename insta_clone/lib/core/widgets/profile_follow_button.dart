import 'package:flutter/material.dart';

class ProfileFollowButton extends StatelessWidget {
  const ProfileFollowButton({super.key, this.onPressed});
final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        // backgroundColor: MaterialStateProperty.all(
        //     Color.fromARGB(0, 90, 103, 223)),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 9, horizontal: 77)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
      child: const Text(
        "Follow",
        style: TextStyle(fontSize: 17),
      ),
    );
  }
}
