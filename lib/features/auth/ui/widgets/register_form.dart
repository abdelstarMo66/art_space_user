import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/text_style_manager.dart';
import 'form_item.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormItem(
          label: "Full Name",
          controller: nameController,
          hintText: "Enter Your Name",
          validator: (value) {},
          keyboardType: TextInputType.name,
        ),
        verticalSpace(18.0),
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
          isObscureText: isObscurePassword,
          suffixIcon: GestureDetector(
            onTap: () => setState(() {
              isObscurePassword = !isObscurePassword;
            }),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                isObscurePassword
                    ? AssetsManager.icEyeClosed
                    : AssetsManager.icEye,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        verticalSpace(18.0),
        FormItem(
          label: "Confirm Password",
          controller: confirmPasswordController,
          hintText: "Re-Enter Password",
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
                isObscureConfirmPassword
                    ? AssetsManager.icEyeClosed
                    : AssetsManager.icEye,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        verticalSpace(18.0),
        FormItem(
          label: "Phone Number",
          controller: phoneController,
          hintText: "Enter Your Phone Number",
          validator: (value) {},
          keyboardType: TextInputType.phone,
        ),
        verticalSpace(18.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              " Gender :",
              style: TextStyleManager.font16DarkPurpleBold,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  isMale = true;
                });
              },
              child: Card(
                elevation: 1.0,
                color: isMale
                    ? ColorManager.dartPurple
                    : ColorManager.moreLightGray,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  child: Text(
                    "Male",
                    style: TextStyleManager.font16DarkPurpleBold.copyWith(
                        color: isMale
                            ? ColorManager.moreLightGray
                            : ColorManager.dartPurple),
                  ),
                ),
              ),
            ),
            horizontalSpace(12.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  isMale = false;
                });
              },
              child: Card(
                elevation: 1.0,
                color: !isMale
                    ? ColorManager.dartPurple
                    : ColorManager.moreLightGray,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  child: Text(
                    "Female",
                    style: TextStyleManager.font16DarkPurpleBold.copyWith(
                        color: !isMale
                            ? ColorManager.moreLightGray
                            : ColorManager.dartPurple),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
