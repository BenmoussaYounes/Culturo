import 'dart:math';

import 'package:flutter/material.dart';

void showSuccessSnackbar(BuildContext context, [String message = 'Operation successful!']) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.greenAccent, duration: Duration(seconds: 3)));
}

void showErrorSnackbar(BuildContext context, [String message = 'An error occurred.']) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), backgroundColor: Colors.redAccent.shade200, duration: const Duration(seconds: 3)),
  );
}

Color getRandomColor() {
  final random = Random();
  return Color.fromRGBO(
    random.nextInt(256), // 0–255
    random.nextInt(256), // 0–255
    random.nextInt(256), // 0–255
    1,
  );
}
