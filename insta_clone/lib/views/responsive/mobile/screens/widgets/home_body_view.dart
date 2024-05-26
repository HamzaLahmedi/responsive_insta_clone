import 'package:cloud_firestore/cloud_firestore.dart';
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
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
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
                  HomeBodyHeader(
                    imgUrl: data['profileImg'] ?? '',
                    userName: data['username'] ?? 'null',
                  ),
                  Image.network(
                    data['imgPost'],
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                  ),
                  const BottomPostIcons(),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    width: double.infinity,
                    child: Text(
                      "${data['likes'].length.toString()} likes",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(214, 157, 157, 165),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 9,
                      ),
                      Text(
                        data['username'],
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 189, 196, 199),
                        ),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      Text(
                        // " ${widget.snap["description"]}",
                        data['description'],
                        textAlign: TextAlign.start,
                        style: const TextStyle(
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
                        '10 june 2024',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(214, 157, 157, 165),
                        ),
                        textAlign: TextAlign.start,
                      )),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
