import 'package:flutter/material.dart';

class ImagesHorizontalListView extends StatelessWidget {
  const ImagesHorizontalListView(
      {super.key, required this.children, this.horizontal = 0});

  final List<Widget> children;
  final double horizontal;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontal),
          child: Row(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.center,
              children: children)),
    );
  }
}
