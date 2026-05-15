import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extentions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/theming.dart';

class SignInSocialButtons extends StatelessWidget {
  const SignInSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _OrDivider(),
        verticalSpace(20),
        _SocialButton(label: 'Continue with Google', icon: _GoogleIcon(), onTap: () {}),
        verticalSpace(12),
        _SocialButton(
          label: 'Continue with Apple',
          icon: Icon(Icons.apple, size: 20.sp, color: ColorsManager.primaryBlack),
          onTap: () {},
        ),
      ],
    );
  }
}

class _GoogleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'G',
      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: const Color(0xFF4285F4)),
    );
  }
}

class _OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 1.5)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text('OR', style: InterFontStyle.font12W600GreyGreen),
        ),
        const Expanded(child: Divider(thickness: 1.5)),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String label;
  final Widget icon;
  final VoidCallback onTap;

  const _SocialButton({required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: OutlinedButton(
        // TODO: Remove hardcoded navigation and use onTap callback instead
        onPressed: () => context.pushNamed(Routes.home), //onTap,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: ColorsManager.primaryBlack.withValues(alpha: 0.2)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.r)),
          backgroundColor: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: .center,
          children: [
            icon,
            horizontalSpace(10),
            Text(label, style: InterFontStyle.font15W500Ink),
          ],
        ),
      ),
    );
  }
}
