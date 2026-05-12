import 'package:flutter/material.dart';

import '../theming/inter_font_style.dart';

class FieldLabel extends StatelessWidget {
  final String text;
  const FieldLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: InterFontStyle.font11W500LightGrey);
  }
}
