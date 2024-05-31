// lib/core/utils/image_upload.dart
import 'dart:typed_data';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/core/utils/custom_snackbar.dart';
import 'package:path/path.dart' show basename;

Future<void> uploadImage2Screen(BuildContext context, Function(Uint8List?, String?) setImage,  {required ImageSource source})  async {
  Navigator.pop(context);
  final XFile? pickedImg = await ImagePicker().pickImage(source: source); // Default to gallery
  try {
    if (pickedImg != null) {
      Uint8List imgPath = await pickedImg.readAsBytes();
      String imgName = basename(pickedImg.path);
      int random = Random().nextInt(9999999);
      imgName = "$random$imgName";
      

      setImage(imgPath, imgName);
    } else {
      if (!context.mounted) return;
      showSnackBar( context, 'NO img selected',);
    }
  } catch (e) {
     if (!context.mounted) return;
  showSnackBar( context, "Error => $e",);
  }
}
