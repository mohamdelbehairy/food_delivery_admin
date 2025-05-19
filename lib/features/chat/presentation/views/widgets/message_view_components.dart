import 'package:flutter/material.dart';

import 'message_item.dart';
import 'message_text_field.dart';
import 'message_view_header.dart';
import 'user_message_item.dart';

class MessageViewComponents extends StatelessWidget {
  const MessageViewComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 8),
          MessageViewHeader(),
          SizedBox(height: 32),
          UserMessageItem(),
          SizedBox(height: 16),
          MessageItem(),
          Spacer(),
          MessageTextField(),
          SizedBox(height: 16),
        ],
      ),
    ));
  }
}
