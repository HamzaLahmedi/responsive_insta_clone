import 'package:flutter/material.dart';

class CustomProfileIcon extends StatelessWidget {
  const CustomProfileIcon({
    super.key,
    required this.icon,
    this.onPressed,
    required this.buttonTitle,
    this.backgroundColor,
    this.borderColor,
  });
  final IconData icon;
  final void Function()? onPressed;
  final String buttonTitle;
  final MaterialStateProperty<Color?>? backgroundColor;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Colors.grey,
        size: 24,
      ),
      label: Text(
        buttonTitle,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: backgroundColor,
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
              vertical: screenWidth > 600 ? 20 : 10, horizontal: 33),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              // width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}
