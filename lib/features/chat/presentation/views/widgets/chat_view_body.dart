import 'package:flutter/material.dart';

import 'chat_background.dart';
import 'chat_view_components.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ChatBackground(),
        const ChatViewComponents(),
      ],
    );
  }
}
