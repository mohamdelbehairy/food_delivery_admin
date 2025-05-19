import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import 'chat_view_components.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(Assets.imagesChatBackground),
        const ChatViewComponents(),
      ],
    );
  }
}
