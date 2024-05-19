import 'package:flutter/material.dart';
import 'package:insta_clone/views/responsive/adaptive_layout.dart';
import 'package:insta_clone/views/responsive/mobile/mobile_view.dart';
import 'package:insta_clone/views/responsive/web/web_view.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

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
