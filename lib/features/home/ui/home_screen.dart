import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Hello In Home",
          style: TextStyleManager.font32DarkBlueBold,
        ),
      ),
    );
  }
}
