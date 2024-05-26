
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

//this method works for web and mobile 
//File doesnot work with web 
getImgURL({
 required String imgName,
 required String folderName,
 required Uint8List imgPath,
 }) async {
 // Upload image to firebase storage
   final storageRef = FirebaseStorage.instance.ref("$folderName/$imgName");
 // use this code if u are using flutter web
 UploadTask uploadTask = storageRef.putData(imgPath);
 TaskSnapshot snap = await uploadTask;
 
 // Get img url
 String url = await snap.ref.getDownloadURL();
 
 return url;
 }