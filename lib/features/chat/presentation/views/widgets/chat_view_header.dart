import 'package:flutter/material.dart';

import 'chat_view_text.dart';

class ChatViewHeader extends StatelessWidget {
  const ChatViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ChatViewText(),
        SizedBox(height: 24),
        ChatViewText(text: "All Message"),
      ],
    );
  }
}
