import 'package:flutter/material.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({
    super.key, this.onPressed,
  });
final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(125, 78, 91, 110),
      ),
      child: Stack(
        children: [
          const CircleAvatar(
            backgroundColor:  Color.fromARGB(255, 225, 225, 225),
            radius: 75,
            backgroundImage: AssetImage("assets/images/avatar.png"),
          ),
          Positioned(
            left: 99,
            bottom: -10,
            child: IconButton(
              onPressed:onPressed,
              icon: const Icon(Icons.add_a_photo),
              color: const Color.fromARGB(255, 208, 218, 224),
            ),
          ),
        ],
      ),
    );
  }
}
