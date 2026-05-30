import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extentions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/theming.dart';
import '../cubit/sign_up_cubit.dart';
import '../widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              verticalSpace(16),
              _BackButton(),
              verticalSpace(24),
              const SignUpHeader(),
              verticalSpace(32),
              SignUpForm(formKey: _formKey, emailController: _emailController, passwordController: _passwordController),
              verticalSpace(20),
              const SignUpSocialButtons(),
              const SignUpBlocListener(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: SignUpFooter(onSendCode: _onSendCode),
      ),
    );
  }

  void _onSendCode() {
    if (_formKey.currentState?.validate() != true) return;
    context.read<SignUpCubit>().sendVerificationCode(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

class _BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: context.pop,
      child: Container(
        width: 36.w,
        height: 36.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: ColorsManager.primaryBlack.withValues(alpha: 0.15)),
        ),
        child: Icon(Icons.arrow_back, size: 18.sp, color: ColorsManager.primaryBlack),
      ),
    );
  }
}
