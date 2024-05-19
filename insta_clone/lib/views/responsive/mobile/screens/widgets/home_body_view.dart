import 'package:flutter/material.dart';
import 'package:insta_clone/core/utils/colors.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/bottom_post_icons.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/home_body_header.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: screenWidth > 600 ? 55 : 0,
          horizontal: screenWidth > 600 ? screenWidth / 6 : 0),
      decoration: BoxDecoration(
        color: mobileBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const HomeBodyHeader(),
          Image.network(
            "https://cdn1-m.alittihad.ae/store/archive/image/2021/10/22/6266a092-72dd-4a2f-82a4-d22ed9d2cc59.jpg?width=1300",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
          ),
          const BottomPostIcons(),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
            width: double.infinity,
            child: const Text(
              "10 Likes",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(214, 157, 157, 165),
              ),
            ),
          ),
          const Row(
            children: [
              SizedBox(
                width: 9,
              ),
              Text(
                "USERNAME ",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 189, 196, 199),
                ),
              ),
              Text(
                // " ${widget.snap["description"]}",
                " Sidi Bou Said ♥",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 189, 196, 199),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
                margin: const EdgeInsets.fromLTRB(10, 13, 9, 10),
                width: double.infinity,
                child: const Text(
                  "view all 100 comments",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(214, 157, 157, 165),
                  ),
                  textAlign: TextAlign.start,
                )),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 9, 10),
              width: double.infinity,
              child: const Text(
                "10June 2022",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(214, 157, 157, 165),
                ),
                textAlign: TextAlign.start,
              )),
        ],
      ),
    );
  }
}
