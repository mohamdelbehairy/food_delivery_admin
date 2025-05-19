import 'package:flutter/material.dart';
import 'package:food_delivery_admin/core/utils/styles.dart';

class ChatViewText extends StatelessWidget {
  const ChatViewText({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: text != null ? Alignment.centerLeft : Alignment.center,
        child: Text(text ?? "Chat List", style: Styles.semiBold16));
  }
}