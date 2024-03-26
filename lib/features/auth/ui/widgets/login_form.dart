import 'package:art_space_user/core/utils/assets_manager.dart';
import 'package:art_space_user/features/auth/logic/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import 'form_item.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = context.read<LoginCubit>();
    return Form(
      key: cubit.loginFormKey,
      child: Column(
        children: [
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
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () => setState(() {
                isObscureText = !isObscureText;
              }),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  isObscureText
                      ? AssetsManager.icEyeClosed
                      : AssetsManager.icEye,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            focusNode: _passwordFocusNode,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }

  String? emailValidation(email) {
    if (email == null || email.isEmpty || !AppRegex.isEmailValid(email)) {
      return "Please Enter a valid email";
    } else {
      return null;
    }
  }

  String? passwordValidation(password) {
    if (password == null || password.isEmpty) {
      return "Please Enter a valid password";
    } else {
      return null;
    }
  }
}
