import 'package:flutter/material.dart';

import 'pick_image_widget.dart';
import 'profile_user_image.dart';

class PersonalDataImageWidget extends StatelessWidget {
  const PersonalDataImageWidget({super.key, this.userImage});

  final String? userImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const AlignmentDirectional(1.1, 1),
      children: [
        ProfileUserImage(imageUrl: userImage),
        const PickImageWidget(),
      ],
    );
  }
}
