import 'package:flutter/material.dart';

import '../utils/material_app_home.dart';

class FoodDeliveryAdmin extends StatelessWidget {
  const FoodDeliveryAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: materialAppHome(),
    );
  }
}
