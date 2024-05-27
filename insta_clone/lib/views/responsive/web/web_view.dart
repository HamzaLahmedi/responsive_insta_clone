import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_clone/core/utils/colors.dart';
import 'package:insta_clone/views/responsive/mobile/screens/add_post_view.dart';
import 'package:insta_clone/views/responsive/mobile/screens/home_view.dart';
import 'package:insta_clone/views/responsive/mobile/screens/profile_view.dart';
import 'package:insta_clone/views/responsive/mobile/screens/register_view.dart';
import 'package:insta_clone/views/responsive/mobile/screens/search_view.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final PageController pageController = PageController();
  int pageIndex = 0;

  void _onItemTapped(int index) {
    pageController.jumpToPage(index);
    setState(() {
      pageIndex = index;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: webBackgroundColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: pageIndex == 0 ? primaryColor : secondaryColor,
            ),
            onPressed: () {
              _onItemTapped(0);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: pageIndex == 1 ? primaryColor : secondaryColor,
            ),
            onPressed: () {
              _onItemTapped(1);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.add_a_photo,
              color: pageIndex == 2 ? primaryColor : secondaryColor,
            ),
            onPressed: () {
              _onItemTapped(2);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: pageIndex == 3 ? primaryColor : secondaryColor,
            ),
            onPressed: () {
              _onItemTapped(3);
            },
          ),
        ],
        title: SvgPicture.asset(
          'assets/images/instagram.svg',
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          height: 32,
        ),
      ),
      body:
          // const RegisterView(),
          PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          const HomeView(),
          const SearchView(),
          const AddPostView(),
          ProfileView(
            uid: FirebaseAuth.instance.currentUser!.uid,
          ),
        ],
      ),
    );
  }
}
