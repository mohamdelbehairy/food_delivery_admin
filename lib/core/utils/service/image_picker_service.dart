import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  Future<List<File>?> pickImage() async {
    final images = await ImagePicker().pickMultiImage();
    return images.map((e) => File(e.path)).toList();
  }
}
