import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/profile_header.dart';
import 'package:insta_clone/views/responsive/mobile/screens/widgets/profile_icons_section.dart';

class ProfileBodyView extends StatefulWidget {
  const ProfileBodyView({
    super.key, required this.onUserNameChanged,
  });
final Function(String) onUserNameChanged;
  @override
  State<ProfileBodyView> createState() => _ProfileBodyViewState();
}

class _ProfileBodyViewState extends State<ProfileBodyView> {
  bool isLoading = true;
  Map userData = {};
  getData() async {
    try {
      setState(() {
        isLoading = true;
      });
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      userData = snapshot.data()!;
      widget.onUserNameChanged(userData['userName']);
    } catch (e) {
      print(e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        : Padding(
            padding: screenWidth > 600
                ? const EdgeInsets.all(40)
                : const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ProfileHeader(
                  imgUrl: userData['imgUrl'],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(35, 21, 0, 0),
                  width: double.infinity,
                  child: Text(userData['title']),
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
