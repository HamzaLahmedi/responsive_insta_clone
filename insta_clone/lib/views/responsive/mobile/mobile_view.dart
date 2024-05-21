import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/core/utils/colors.dart';
import 'package:insta_clone/views/responsive/mobile/screens/add_post_view.dart';
import 'package:insta_clone/views/responsive/mobile/screens/home_view.dart';
import 'package:insta_clone/views/responsive/mobile/screens/profile_view.dart';
import 'package:insta_clone/views/responsive/mobile/screens/register_view.dart';
import 'package:insta_clone/views/responsive/mobile/screens/search_view.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  final PageController pageController = PageController();
  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const RegisterView(),
      /*  PageView(
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomeView(),
          SearchView(),
          AddPostView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
          backgroundColor: mobileBackgroundColor,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          activeColor: primaryColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.add_circled),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
            ),
          ]),*/
    );
  }
}
