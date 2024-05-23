import 'package:flutter/material.dart';
import 'package:insta_clone/core/utils/colors.dart';

showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(seconds: 10),
    elevation: 0,
    backgroundColor: mobileBackgroundColor,
    content: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
    action: SnackBarAction(
      label: "close",
      onPressed: () {},
      textColor: Colors.white,
    ),
  ));
}