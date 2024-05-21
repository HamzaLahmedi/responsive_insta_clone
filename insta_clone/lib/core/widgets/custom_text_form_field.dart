import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.text,
      this.isObsecure,
      this.keyboardType,
      this.controller, this.validator, this.suffixIcon});
  final String text;
  final bool? isObsecure;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)?  validator;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      validator:validator ,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        label: Text(
          text,
          style: const TextStyle(
            color: Color(0xff828282),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        suffixIcon: suffixIcon,
        fillColor: const Color(0xff16181C),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white //Color(0xff16181C),
              ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xff16181C),
          ),
        ),
      ),
      obscureText: isObsecure ?? false,
      
      keyboardType: keyboardType,
    );
  }
}