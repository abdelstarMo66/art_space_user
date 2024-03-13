import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/assets_manager.dart';
import 'form_item.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormItem(
          label: "Password",
          controller: passwordController,
          hintText: "Enter New Password",
          validator: (value) {},
          keyboardType: TextInputType.visiblePassword,
          isObscureText: isObscurePassword,
          suffixIcon: GestureDetector(
            onTap: () => setState(() {
              isObscurePassword = !isObscurePassword;
            }),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                isObscurePassword ? AssetsManager.icEyeClosed : AssetsManager.icEye,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        verticalSpace(18.0),
        FormItem(
          label: "Confirm Password",
          controller: confirmPasswordController,
          hintText: "Re-Enter New Password",
          validator: (value) {},
          keyboardType: TextInputType.visiblePassword,
          isObscureText: isObscureConfirmPassword,
          suffixIcon: GestureDetector(
            onTap: () => setState(() {
              isObscureConfirmPassword = !isObscureConfirmPassword;
            }),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                isObscureConfirmPassword ? AssetsManager.icEyeClosed : AssetsManager.icEye,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
