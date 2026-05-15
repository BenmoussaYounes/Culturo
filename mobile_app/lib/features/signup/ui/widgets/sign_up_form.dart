import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/app_validators.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/theming.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/field_label.dart';
import 'password_strength_indicator.dart';

class SignUpForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignUpForm({super.key, required this.formKey, required this.emailController, required this.passwordController});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isPasswordVisible = false;
  bool _isEmailValid = false;
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          FieldLabel('EMAIL'),
          verticalSpace(6),
          AppTextFormField(
            controller: widget.emailController,
            hintText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
            onChanged: _onEmailChanged,
            validator: AppValidators.validateEmail,
            suffixIcon: _isEmailValid
                ? Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: Icon(Icons.check, color: DesertColors.primary, size: 20.sp),
                  )
                : null,
          ),
          verticalSpace(4),
          Text("We'll send your verification code here.", style: InterFontStyle.font12W400GreyGreen),
          verticalSpace(16),
          FieldLabel('PASSWORD'),
          verticalSpace(6),
          AppTextFormField(
            controller: widget.passwordController,
            validator: AppValidators.validatePassword,
            obscureText: !_isPasswordVisible,
            hintText: 'Enter your password',
            onChanged: _onPasswordChanged,
            suffixIcon: GestureDetector(
              onTap: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
              child: Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: Text(_isPasswordVisible ? 'Hide' : 'Show', style: InterFontStyle.font13W500Accent),
              ),
            ),
          ),
          if (_password.isNotEmpty) ...[verticalSpace(12), PasswordStrengthIndicator(password: _password)],
        ],
      ),
    );
  }

  void _onEmailChanged(String value) {
    final valid = AppRegex.isEmailValid(value);
    if (valid != _isEmailValid) setState(() => _isEmailValid = valid);
  }

  void _onPasswordChanged(String value) {
    setState(() => _password = value);
  }
}
