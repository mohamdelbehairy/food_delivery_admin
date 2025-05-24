import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../core/model/cached_image_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_cached_image.dart';

class ProfileUserImage extends StatelessWidget {
  const ProfileUserImage({super.key, this.imageUrl, this.imageFile});

  final String? imageUrl;
  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          border: imageUrl != null
              ? null
              : Border.all(width: .3, color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(100)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: imageFile != null
              ? Image.file(imageFile!, fit: BoxFit.cover)
              : imageUrl == null
                  ? Image.asset(Assets.imagesDefaultProfile, fit: BoxFit.fill)
                  : CustomCachedImage(
                      cachedImageModel: CachedImageModel(
                          fit: BoxFit.cover, imageUrl: imageUrl!))),
    );
  }
}
