import 'package:flutter/material.dart';
import 'package:insta_clone/core/utils/colors.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/bottom_post_icons.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/home_body_header.dart';
import 'package:intl/intl.dart';

class CustomPostItem extends StatefulWidget {
  const CustomPostItem({super.key, required this.data});
final Map data;
  @override
  State<CustomPostItem> createState() => _CustomPostItemState();
}

class _CustomPostItemState extends State<CustomPostItem> {
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
                  HomeBodyHeader(
                    imgUrl: widget.data['profileImg'] ?? '',
                    userName: widget.data['username'] ?? 'null',
                  ),
                  Image.network(
                    widget.data['imgPost'],
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                  ),
                   BottomPostIcons(
                    data: widget.data,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    width: double.infinity,
                    child: Text(
                      widget.data['likes'].length > 1
                          ? " ${widget.data['likes'].length.toString()} likes"
                          : "${widget.data['likes'].length.toString()} like",
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
                        widget.data['username'],
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
                        widget.data['description'],
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
                      child: Text(
                        DateFormat('yMMMd')
                            .format(widget.data['datePublished'].toDate()),
                        style: const TextStyle(
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