import 'package:flutter/material.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/profile_header.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/profile_icons_section.dart';

class ProfileBodyView extends StatelessWidget {
  const ProfileBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: screenWidth > 600
          ? const EdgeInsets.all(40)
          : const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const ProfileHeader(),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 21, 0, 0),
            width: double.infinity,
            child: const Text(' Cute & nice girl'),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            color: Colors.white,
            thickness: 0.44,
          ),
          const SizedBox(
            height: 9,
          ),
          const IconsSection(),
          const SizedBox(
            height: 9,
          ),
          const Divider(
            color: Colors.white,
            thickness: 0.44,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      "https://cdn1-m.alittihad.ae/store/archive/image/2021/10/22/6266a092-72dd-4a2f-82a4-d22ed9d2cc59.jpg?width=1300",
                      fit: BoxFit.cover,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
