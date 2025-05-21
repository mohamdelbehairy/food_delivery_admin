import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _firebaseStorage;

  FirebaseStorageService(this._firebaseStorage);

  Future<String> uploadImage(File image) async {
    final imageName = DateTime.now().millisecondsSinceEpoch.toString();
    final ref = _firebaseStorage.ref().child("images/$imageName");
    await ref.putFile(image);
    return await ref.getDownloadURL();
  }

  Future<List<String>> uploadImages(List<File> images) async {
    final futureList = images.asMap().entries.map((e) async {
      final index = e.key;
      final image = e.value;
      final imageName = '${DateTime.now().millisecondsSinceEpoch}_$index';
      final ref = _firebaseStorage.ref().child("images/$imageName");
      await ref.putFile(image);
      return await ref.getDownloadURL();
    });
    return await Future.wait(futureList);
  }
}
