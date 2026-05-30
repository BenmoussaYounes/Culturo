import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/app_validators.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/theming.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/field_label.dart';

class SignInForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInForm({super.key, required this.formKey, required this.emailController, required this.passwordController});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _isPasswordVisible = false;
  bool _isEmailValid = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldLabel('EMAIL'),
          verticalSpace(6),
          AppTextFormField(
            controller: widget.emailController,
            hintText: 'Enter your email',
            onChanged: _onEmailChanged,
            validator: AppValidators.validateEmail,
            suffixIcon: _isEmailValid
                ? Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: Icon(Icons.check, color: DesertColors.primary, size: 20.sp),
                  )
                : null,
          ),
          verticalSpace(16),
          FieldLabel('PASSWORD'),
          verticalSpace(6),
          AppTextFormField(
            controller: widget.passwordController,
            validator: AppValidators.validatePassword,
            obscureText: !_isPasswordVisible,
            hintText: 'Enter your password',
            suffixIcon: GestureDetector(
              onTap: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
              child: Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: Icon(
                  _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                  color: ColorsManager.greyGreen,
                  size: 16.sp,
                ),
              ),
            ),
          ),
          verticalSpace(8),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: Text('Forgot password?', style: InterFontStyle.font13W700Accent),
            ),
          ),
        ],
      ),
    );
  }

  void _onEmailChanged(String value) {
    final valid = AppRegex.isEmailValid(value);
    if (valid != _isEmailValid) setState(() => _isEmailValid = valid);
  }
}
