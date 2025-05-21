import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  Future<List<File>?> pickImage() async {
    final images = await ImagePicker().pickMultiImage(
      maxHeight: 1080,
      maxWidth: 1080,
      imageQuality: 75,
    );
    return images.map((e) => File(e.path)).toList();
  }
}
