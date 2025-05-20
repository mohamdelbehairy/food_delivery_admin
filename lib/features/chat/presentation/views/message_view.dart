import 'package:flutter/material.dart';

import 'widgets/message_view_body.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: MessageViewBody(),
    );
  }
}