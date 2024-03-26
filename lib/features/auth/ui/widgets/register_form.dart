import 'package:art_space_user/core/helpers/app_regex.dart';
import 'package:art_space_user/core/theming/color_manager.dart';
import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:art_space_user/features/auth/logic/register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = context.read<RegisterCubit>();

    return Form(
      key: cubit.registerFormKey,
      child: Column(
        children: [
          FormItem(
            label: "Full Name",
            controller: cubit.nameController,
            hintText: "Enter Your Name",
            validator: (value) => nameValidation(value),
            keyboardType: TextInputType.name,
            focusNode: _nameFocusNode,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(18.0),
          FormItem(
            label: "Email Address",
            controller: cubit.emailController,
            hintText: "Enter Your Email",
            validator: (value) => emailValidation(value),
            keyboardType: TextInputType.emailAddress,
            focusNode: _emailFocusNode,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(18.0),
          FormItem(
            label: "Password",
            controller: cubit.passwordController,
            hintText: "Enter Your Password",
            validator: (value) => passwordValidation(value),
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
            focusNode: _passwordFocusNode,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(18.0),
          FormItem(
            label: "Confirm Password",
            controller: cubit.passwordConfirmController,
            hintText: "Re-Enter Password",
            validator: (value) =>
                confirmPasswordValidation(value, cubit.passwordController.text),
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
            focusNode: _confirmPasswordFocusNode,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(18.0),
          FormItem(
            label: "Phone Number",
            controller: cubit.phoneController,
            hintText: "Enter Your Phone Number",
            validator: (value) => phoneValidation(value),
            keyboardType: TextInputType.phone,
            focusNode: _phoneFocusNode,
            textInputAction: TextInputAction.done,
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
                    cubit.isMale = true;
                  });
                },
                child: Card(
                  elevation: 1.0,
                  color: cubit.isMale
                      ? ColorManager.dartPurple
                      : ColorManager.moreLightGray,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    child: Text(
                      "Male",
                      style: TextStyleManager.font16DarkPurpleBold.copyWith(
                          color: cubit.isMale
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
                    cubit.isMale = false;
                  });
                },
                child: Card(
                  elevation: 1.0,
                  color: !cubit.isMale
                      ? ColorManager.dartPurple
                      : ColorManager.moreLightGray,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    child: Text(
                      "Female",
                      style: TextStyleManager.font16DarkPurpleBold.copyWith(
                          color: !cubit.isMale
                              ? ColorManager.moreLightGray
                              : ColorManager.dartPurple),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String? nameValidation(String? name) {
    if (name == null || name.isEmpty || name.length < 3) {
      return "Please Enter a valid name";
    } else {
      return null;
    }
  }

  String? emailValidation(String? email) {
    if (email == null || email.isEmpty || !AppRegex.isEmailValid(email)) {
      return "Please Enter a valid email";
    } else {
      return null;
    }
  }

  String? passwordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return "Please Enter a valid password";
    } else if (password.length < 8) {
      return "password too short, minimum 8 characters";
    } else if (!AppRegex.isPasswordValid(password)) {
      return "Please Enter a strong password";
    } else {
      return null;
    }
  }

  String? confirmPasswordValidation(String? confirmPassword, String password) {
    if (password != confirmPassword) {
      return "password confirmation not match password";
    } else {
      return null;
    }
  }

  String? phoneValidation(String? phone) {
    if (phone == null || phone.isEmpty || !AppRegex.isPhoneValid(phone)) {
      return "Please Enter a valid phone";
    } else {
      return null;
    }
  }
}
