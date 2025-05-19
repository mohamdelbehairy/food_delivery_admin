import 'package:flutter/material.dart';

import 'chat_list_view.dart';
import 'chat_view_header.dart';

class ChatViewComponents extends StatelessWidget {
  const ChatViewComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 8),
            const ChatViewHeader(),
            const SizedBox(height: 24),
            const ChatListView(),
          ],
        ),
      ),
    );
  }
}