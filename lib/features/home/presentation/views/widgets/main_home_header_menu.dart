import 'package:flutter/material.dart';

class MainHomeHeaderMenu extends StatelessWidget {
  const MainHomeHeaderMenu({super.key, required this.onTap});
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.white)),
          child: Icon(Icons.menu, size: 18, color: Colors.white)),
    );
  }
}