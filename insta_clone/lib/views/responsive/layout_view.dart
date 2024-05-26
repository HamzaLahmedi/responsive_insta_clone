import 'package:flutter/material.dart';
import 'package:insta_clone/provider/user_provier.dart';
import 'package:insta_clone/views/responsive/adaptive_layout.dart';
import 'package:insta_clone/views/responsive/mobile/mobile_view.dart';
import 'package:insta_clone/views/responsive/web/web_view.dart';
import 'package:provider/provider.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  // To get data from DB using provider
 getDataFromDB() async {
 UserProvider userProvider = Provider.of(context, listen: false);
 await userProvider.refreshUser();
 }
 
 
 @override
 void initState() {
    super.initState();
    getDataFromDB();
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => const MobileView(),
        tabletLayout: (context) => const MobileView(),
        desktopLayout: (context) => const WebView(),
      ),
    );
  }
}
