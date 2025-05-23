import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class ProfileUserNameAndEmail extends StatelessWidget {
  const ProfileUserNameAndEmail(
      {super.key, required this.userName, required this.userEmail});

  final String userName, userEmail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(userName, style: Styles.semiBold16),
        Text(userEmail,
            style: Styles.regular14.copyWith(color: const Color(0xff878787))),
      ],
    );
  }
}
