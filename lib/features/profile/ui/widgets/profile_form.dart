import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_style_manager.dart';
import '../../../../core/widgets/app_text_button.dart';
import 'custom_profile_text_form.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool enabled = false;

  @override
  void initState() {
    super.initState();
    nameController.text = "Muhammed Ahmed";
    emailController.text = "mohamedabdelstar30@gmail.com";
    phoneController.text = "0105060964";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          CustomProfileTextForm(
            controller: emailController,
            type: TextInputType.emailAddress,
            label: "Email",
          ),
          CustomProfileTextForm(
            controller: nameController,
            type: TextInputType.name,
            label: "Name",
            enabled: enabled,
          ),
          CustomProfileTextForm(
            controller: phoneController,
            type: TextInputType.phone,
            label: "Phone",
            enabled: enabled,
          ),
          verticalSpace(22.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: AppTextButton(
              buttonText: enabled ? "Save" : "Edit",
              buttonWidth: 250,
              textStyle: TextStyleManager.font20OriginalWhiteSemiBold,
              onPressed: () {
                setState(() {
                  enabled = !enabled;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
