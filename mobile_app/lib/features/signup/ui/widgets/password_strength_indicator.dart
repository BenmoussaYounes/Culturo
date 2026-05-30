import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/theming.dart';

class PasswordStrengthIndicator extends StatelessWidget {
  final String password;

  const PasswordStrengthIndicator({super.key, required this.password});

  @override
  Widget build(BuildContext context) {
    final hasLength = AppRegex.hasMinLength(password);
    final hasNumber = AppRegex.hasNumber(password);
    final hasSymbol = AppRegex.hasSpecialCharacter(password);
    final hasMixedCase = AppRegex.hasUpperCase(password) && AppRegex.hasLowerCase(password);
    final score = [hasLength, hasNumber, hasSymbol, hasMixedCase].where((v) => v).length;

    return Column(
      crossAxisAlignment: .start,
      children: [
        _StrengthBar(score: score),
        verticalSpace(10),
        _RequirementItem(met: hasLength, label: 'At least 8 characters'),
        verticalSpace(4),
        _RequirementItem(met: hasNumber, label: 'One number'),
        verticalSpace(4),
        _RequirementItem(met: hasSymbol, label: 'One symbol (! @ # ...)'),
        verticalSpace(4),
        _RequirementItem(met: hasMixedCase, label: 'Mix of upper & lowercase'),
      ],
    );
  }
}

class _StrengthBar extends StatelessWidget {
  final int score;

  const _StrengthBar({required this.score});

  @override
  Widget build(BuildContext context) {
    final (color, label) = switch (score) {
      0 || 1 => (SemanticColors.danger, 'Weak'),
      2 => (SemanticColors.warning, 'Fair'),
      3 => (SemanticColors.success, 'Good'),
      _ => (DesertColors.primary, 'Strong'),
    };

    return Row(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: score / 4,
              backgroundColor: ColorsManager.greyGreen.withValues(alpha: 0.15),
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 4.h,
            ),
          ),
        ),
        horizontalSpace(8),
        Text(label, style: InterFontStyle.font12W600GreyGreen.copyWith(color: color)),
      ],
    );
  }
}

class _RequirementItem extends StatelessWidget {
  final bool met;
  final String label;

  const _RequirementItem({required this.met, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          met ? Icons.check_circle : Icons.radio_button_unchecked,
          size: 16.sp,
          color: met ? SemanticColors.success : ColorsManager.lightGrey,
        ),
        horizontalSpace(6),
        Text(
          label,
          style: InterFontStyle.font12W600GreyGreen.copyWith(
            color: met ? SemanticColors.success : ColorsManager.lightGrey,
            fontWeight: met ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
