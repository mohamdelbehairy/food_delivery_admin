import 'package:flutter/material.dart';

import 'chat_background.dart';
import 'message_view_components.dart';

class MessageViewBody extends StatelessWidget {
  const MessageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ChatBackground(),
        const MessageViewComponents(),
      ],
    );
  }
}
