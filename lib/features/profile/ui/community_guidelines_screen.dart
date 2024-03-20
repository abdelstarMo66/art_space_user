import 'package:art_space_user/core/theming/text_style_manager.dart';
import 'package:flutter/material.dart';

class CommunityGuidelinesScreen extends StatelessWidget {
  const CommunityGuidelinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Hello In CommunityGuidelines",
          style: TextStyleManager.font32LightBlackBold,
        ),
      ),
    );
  }
}
