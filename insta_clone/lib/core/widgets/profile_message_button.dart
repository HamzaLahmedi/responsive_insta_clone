import 'package:flutter/material.dart';

class ProfileMessageButton extends StatelessWidget {
  const ProfileMessageButton({super.key, this.onPressed});
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xFF673AB7),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: 9,
            horizontal: screenWidth * .08,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
      child: const Text(
        "Message",
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
      ),
    );
  }
}
