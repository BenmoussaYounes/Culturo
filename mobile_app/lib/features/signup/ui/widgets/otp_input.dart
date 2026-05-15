import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/theming.dart';

class OtpInput extends StatefulWidget {
  final TextEditingController controller;

  const OtpInput({super.key, required this.controller});

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _focusNode.requestFocus(),
      child: Stack(
        children: [
          _OtpBoxes(controller: widget.controller, focusNode: _focusNode),
          Opacity(
            opacity: 0,
            child: TextField(
              controller: widget.controller,
              focusNode: _focusNode,
              keyboardType: TextInputType.number,
              maxLength: 6,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (_) => setState(() {}),
              decoration: const InputDecoration(counterText: ''),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}

class _OtpBoxes extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const _OtpBoxes({required this.controller, required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, _) {
        final text = value.text;
        return Row(
          mainAxisAlignment: .center,
          children: List.generate(6, (i) {
            return Padding(
              padding: EdgeInsets.only(right: i < 5 ? 8.w : 0),
              child: _OtpBox(char: i < text.length ? text[i] : null, isFocused: text.length == i && focusNode.hasFocus),
            );
          }),
        );
      },
    );
  }
}

class _OtpBox extends StatelessWidget {
  final String? char;
  final bool isFocused;

  const _OtpBox({this.char, required this.isFocused});

  @override
  Widget build(BuildContext context) {
    final isFilled = char != null;
    return Container(
      width: 46.w,
      height: 54.h,
      decoration: BoxDecoration(
        color: isFilled ? ColorsManager.primaryBlack : Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isFocused
              ? DesertColors.primary
              : isFilled
              ? ColorsManager.primaryBlack
              : ColorsManager.primaryBlack.withValues(alpha: 0.2),
          width: isFocused ? 1.5 : 1,
        ),
      ),
      alignment: .center,
      child: isFilled
          ? Text(char!, style: InterFontStyle.font16W600White.copyWith(fontSize: 22.sp))
          : isFocused
          ? Container(width: 1.5.w, height: 20.h, color: ColorsManager.primaryBlack)
          : null,
    );
  }
}
