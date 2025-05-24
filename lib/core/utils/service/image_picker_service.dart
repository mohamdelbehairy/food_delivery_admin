import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  Future<File?> pickImage() async {
    File? image;
    final returnImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 1080,
        maxWidth: 1080,
        imageQuality: 75);

    if (returnImage != null) {
      image = File(returnImage.path);
    }

    return image;
  }

  Future<List<File>?> pickImages() async {
    final images = await ImagePicker().pickMultiImage(
      maxHeight: 1080,
      maxWidth: 1080,
      imageQuality: 75,
    );
    return images.map((e) => File(e.path)).toList();
  }
}
