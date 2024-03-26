import 'package:art_space_user/features/auth/logic/forget_password/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    ForgetPasswordCubit cubit = context.read<ForgetPasswordCubit>();

    return Form(
      key: cubit.resetPassFormKey,
      child: Column(
        children: [
          FormItem(
            label: "Password",
            controller: cubit.passwordController,
            hintText: "Enter New Password",
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
            hintText: "Re-Enter New Password",
            validator: (value) => passwordValidation(value),
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
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }

  String? passwordValidation(password) {
    if (password == null || password.isEmpty) {
      return "Please Enter a valid password";
    } else {
      return null;
    }
  }
}
