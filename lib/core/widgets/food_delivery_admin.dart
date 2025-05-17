import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/welcome_view.dart';

class FoodDeliveryAdmin extends StatelessWidget {
  const FoodDeliveryAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomeView(),
    );
  }
}
