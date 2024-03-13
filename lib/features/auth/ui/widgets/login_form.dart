import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import 'form_item.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormItem(
          label: "Email Address",
          controller: emailController,
          hintText: "Enter Your Email",
          validator: (value) {},
          keyboardType: TextInputType.emailAddress,
        ),
        verticalSpace(18.0),
        FormItem(
          label: "Password",
          controller: passwordController,
          hintText: "Enter Your Password",
          validator: (value) {},
          keyboardType: TextInputType.visiblePassword,
          isObscureText: isObscureText,
          suffixIcon: GestureDetector(
            onTap: () => setState(() {
              isObscureText = !isObscureText;
            }),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                isObscureText ? AssetsManager.icEyeClosed : AssetsManager.icEye,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
