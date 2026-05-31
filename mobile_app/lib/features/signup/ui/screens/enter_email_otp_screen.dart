import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extentions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/theming.dart';
import '../cubit/enter_email_otp_cubit.dart';
import '../widgets/widgets.dart';

class EnterEmailOtpScreen extends StatefulWidget {
  final String email;
  final String password;

  const EnterEmailOtpScreen({super.key, required this.email, required this.password});

  @override
  State<EnterEmailOtpScreen> createState() => _EnterEmailOtpScreenState();
}

class _EnterEmailOtpScreenState extends State<EnterEmailOtpScreen> {
  late TextEditingController _otpController;

  @override
  void initState() {
    _otpController = TextEditingController();
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
              VerifyEmailHeader(email: widget.email),
              verticalSpace(32),
              OtpInput(controller: _otpController),
              verticalSpace(24),
              const EnterEmailOtpBlocListener(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: ValueListenableBuilder(
          valueListenable: _otpController,
          builder: (context, value, _) =>
              EnterOtpFooter(isOtpComplete: value.text.length == 6, onOtpValidation: _onOtpValidation),
        ),
      ),
    );
  }

  void _onOtpValidation() {
    context.read<EnterEmailOtpCubit>().signUp(
      email: widget.email,
      password: widget.password,
      code: _otpController.text,
    );
  }

  @override
  void dispose() {
    _otpController.dispose();
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
