import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import 'message_item.dart';

class UserMessageItem extends StatelessWidget {
  const UserMessageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: [
          Image.asset(Assets.imagesImage),
          const SizedBox(width: 8),
          Text("Stevano Clirover", style: Styles.semiBold14),
        ],
      ),
      subtitle: Padding(
          padding: EdgeInsets.only(top: 8, left: 44),
          child: const MessageItem(isFriend: true)),
    );
  }
}
