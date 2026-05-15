import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extentions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/theming.dart';
import '../cubit/verify_email_cubit.dart';
import '../widgets/widgets.dart';

class VerifyEmailScreen extends StatefulWidget {
  final String email;

  const VerifyEmailScreen({super.key, required this.email});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
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
              const VerifyEmailInboxPreview(),
              const VerifyEmailBlocListener(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: ValueListenableBuilder(
          valueListenable: _otpController,
          builder: (context, value, _) => VerifyEmailFooter(isOtpComplete: value.text.length == 6, onVerify: _onVerify),
        ),
      ),
    );
  }

  void _onVerify() {
    context.read<VerifyEmailCubit>().verify(code: _otpController.text);
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
