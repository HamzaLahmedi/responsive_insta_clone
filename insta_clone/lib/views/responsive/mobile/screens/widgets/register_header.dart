import 'package:flutter/material.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({
    super.key,
  });

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
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 225, 225, 225),
            radius: 71,
            // backgroundImage: AssetImage("assets/img/avatar.png"),
            backgroundImage: Image.network(
                    "https://i.pinimg.com/564x/94/df/a7/94dfa775f1bad7d81aa9898323f6f359.jpg")
                .image,
          ),
          Positioned(
            left: 99,
            bottom: -10,
            child: IconButton(
              onPressed: () {
               
              },
              icon: const Icon(Icons.add_a_photo),
              color: const Color.fromARGB(255, 208, 218, 224),
            ),
          ),
        ],
      ),
    );
  }
}
