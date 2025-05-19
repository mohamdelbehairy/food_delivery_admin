import 'package:flutter/material.dart';

import '../../../../../core/utils/navigation.dart';
import '../message_view.dart';
import 'chat_item.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: ChatItem(
              onTap: () => Navigation.push(context, const MessageView())),
        ),
      ),
    );
  }
}
