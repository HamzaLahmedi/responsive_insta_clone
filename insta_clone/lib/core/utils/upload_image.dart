import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UploadImg {
  Future<File?> uploadImage(ImageSource source) async {
    final pickedImg = await ImagePicker().pickImage(source: source);
    if (pickedImg != null) {
      
      
      return File(pickedImg.path);
    } else {
      return null;
    }
  }

 /* Future<String?> uploadImageWithName(ImageSource source) async {
    final imgNamePicked = await ImagePicker().pickImage(source: source);
    if (imgNamePicked != null) {
      return basename(imgNamePicked.path);
    } else {
      print("No image selected");
      return null;
    }
  }*/
}