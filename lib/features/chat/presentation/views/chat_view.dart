import 'package:flutter/material.dart';

import 'widgets/chat_view_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9).withValues(alpha: .8),
      body: const ChatViewBody(),
    );
  }
}
