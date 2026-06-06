import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/app_regex.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/theming.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../../../core/widgets/field_label.dart';
import 'cubit/forgot_password_cubit.dart';
import 'widgets/forgot_password_bloc_listener.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final String initialEmail;

  const ForgotPasswordScreen({super.key, this.initialEmail = ''});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController _emailController;
  late GlobalKey<FormState> _formKey;
  bool _isEmailValid = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.initialEmail);
    _isEmailValid = AppRegex.isEmailValid(widget.initialEmail);
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ForgotPasswordCubit>(),
      child: ForgotPasswordBlocListener(
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  verticalSpace(32),
                  _Header(),
                  verticalSpace(32),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        FieldLabel('EMAIL'),
                        verticalSpace(6),
                        AppTextFormField(
                          controller: _emailController,
                          hintText: 'Enter your email',
                          keyboardType: .emailAddress,
                          onChanged: _onEmailChanged,
                          validator: _validateEmail,
                          suffixIcon: _isEmailValid
                              ? Padding(
                                  padding: EdgeInsets.only(right: 12.w),
                                  child: Icon(Icons.check, color: DesertColors.primary, size: 20.sp),
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: _SubmitButton(onTap: _onSubmit),
          ),
        ),
      ),
    );
  }

  void _onEmailChanged(String value) {
    final valid = AppRegex.isEmailValid(value);
    if (valid != _isEmailValid) setState(() => _isEmailValid = valid);
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email is required';
    if (!AppRegex.isEmailValid(value)) return 'Enter a valid email';
    return null;
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() != true) return;
    context.read<ForgotPasswordCubit>().sendResetLink(_emailController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text('FORGOT PASSWORD', style: InterFontStyle.font10W600Primary),
        verticalSpace(4),
        Text('Reset your\naccount.', style: InstrumentSerifFontStyle.font38W400BlackItalic.copyWith(height: 1.h)),
        verticalSpace(8),
        Text("We'll send a reset link to your email.", style: InterFontStyle.font14W500GreyGreen),
      ],
    );
  }
}

class _SubmitButton extends StatelessWidget {
  final VoidCallback onTap;

  const _SubmitButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, state) {
        final isLoading = state is ForgotPasswordLoading;
        return SizedBox(
          width: double.infinity,
          height: 52.h,
          child: ElevatedButton(
            onPressed: isLoading ? null : onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.primaryBlack,
              disabledBackgroundColor: ColorsManager.primaryBlack.withValues(alpha: 0.6),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
            ),
            child: isLoading
                ? SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: const CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                  )
                : Text('Send reset link', style: InterFontStyle.font16W600White),
          ),
        );
      },
    );
  }
}
