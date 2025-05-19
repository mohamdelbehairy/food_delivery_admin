import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class ProductItemImage extends StatelessWidget {
  const ProductItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(Assets.imagesBurgerTest),
        // Positioned(
        //   top: 8,
        //   right: 8,
        //   child: CircleAvatar(
        //       radius: 15,
        //       backgroundColor: Colors.white,
        //       child: Icon(Icons.favorite_border, size: 20, color: Colors.red)),
        // ),
      ],
    );
  }
}